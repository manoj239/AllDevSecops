delete_ebs_vols() {
    vols=$(aws ec2 describe-volumes --region $1 | jq ".Volumes[].VolumeId" -r)
    for vol in $vols; do
        size=$(aws ec2 describe-volumes --volume-ids $vol --region $1 | jq ".Volumes[].Size" -r)
        state=$(aws ec2 describe-volumes --volume-ids $vol --region $1 | jq ".Volumes[].State" -r)
        if [ ${size} -gt 5 -a ${state} == 'in-use' ]; then
            echo "$vol is valid volume .Dont Delete"
        else
            echo "Deleting volume $vol in the Region $1"
            aws ec2 delete-volume --volume-id $vol --region $1
        fi
    done
}

delete_ebs_vols $1
REGION_LIST=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r | wc -l)
REGIONS=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
echo "We have a total of $REGION_LIST Regions..."
for REGION in ${REGIONS[@]}; do
    echo "Lets Delete the volumes for Region ${REGION}.."
    delete_ebs_vols $REGION
done
