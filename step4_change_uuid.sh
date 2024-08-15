    #!/bin/bash
     
    # Function to change the UUID of a partition
    change_uuid() {
        local partition=$1
        local new_uuid=$2
     
        echo "Changing UUID of $partition to $new_uuid"
        sudo tune2fs -U $new_uuid $partition
    }
     
    # Function to generate a new UUID
    generate_uuid() {
        uuidgen
    }
     
    echo "STEP 4: Change your Disk Serial Number (UUID)"
     
    # Specify the partition whose UUID you want to change
    partition="/dev/sdX1"  # Replace with your actual partition, e.g., /dev/sda1
     
    # Generate a new UUID or set a specific one
    new_uuid=$(generate_uuid)  # Or specify a custom UUID, e.g., new_uuid="12345678-1234-1234-1234-123456789abc"
     
    # Change the UUID
    change_uuid $partition $new_uuid
     
    echo "New UUID for $partition is $new_uuid"
    echo "STEP 4: Change your Disk Serial Number (UUID) is complete."