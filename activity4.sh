function get_instance_ids_by_tags() {
tag_name=$1
tag_value=$2
# if user doesnot pass tag_name as 1 arument Env as default
if [[ -z $tag_name ]]; then
    tag_name="Env"
fi
# if user does not pass tag_value as 2 argument DEV is default
if [[ -z $tag_value ]]; then
tag_value="QAT"
fi

instanceIds=$(aws ec2 describe-instances --filters "Name=tag:${tag_name},Values=${tag_value}" --query "Reservations[].Instances[].InstanceId" --output text)
echo $instanceIds
}
instance_ids=$(get_instance_ids_by_tags $1 $2)
for instance_id in $instance_ids
do
    echo "Resizing instance id ${instance_id}"
    aws ec2 modify-instance-attribute --instance-id $instance_id --instance-type t2.medium
done
