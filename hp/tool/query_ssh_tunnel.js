const util = require('util')
const exec = util.promisify(require('child_process').exec)

const REGION = 'ap-southeast-1'

const getSsmParameter = async (name) => {
    const command =
        `aws ssm get-parameter --region=ap-southeast-1 --name ${name} --query Parameter.Value --output text`
    const { stdout } = await exec(command)
    return stdout.trim()
}

const describeAsg = async (asgName) => {
    const command =
        `aws autoscaling describe-auto-scaling-groups --region ${REGION} --auto-scaling-group-names ${asgName}`
    const { stdout } = await exec(command)
    return JSON.parse(stdout)
}

const getBastionId = async () => {
    const name = '/vcosmos-ii-bastion/auto-scaling-group'
    const asgName = await getSsmParameter(name)
    const data = await describeAsg(asgName)
    const instanceId = data.AutoScalingGroups[0].Instances[0].InstanceId
    return instanceId
}

const getMqEndPoint = async () => {
    const address = await getSsmParameter('/vcosmos-ii-mq/broker/cfn/address')
    const port = await getSsmParameter('/vcosmos-ii-mq/broker/cfn/port')
    return `${address}:${port}`
}

const getMqWebEndPoint = async () => {
    const address = await getSsmParameter('/vcosmos-ii-mq/broker/cfn/address')
    const port = 443
    return `${address}:${port}`
}

const main = async () => {
    const localMq = '5559'
    const localMqWeb = '127.0.0.1:5443'
    const newDBCluster = '-L 5566:172.30.15.10:27017 -L 5567:172.30.15.40:27017 -L 5568:172.30.15.80:27017 -L 5569:172.30.15.90:27017'
    const [bastionId, remoteMq, remoteMqWeb] = await Promise.all([
        getBastionId(), getMqEndPoint(), getMqWebEndPoint(),
    ])
    const command = `ssh ec2-user@${bastionId}--${REGION} ${newDBCluster} -L ${localMq}:${remoteMq} -L ${localMqWeb}:${remoteMqWeb}`
    console.log(command)
}

main()
