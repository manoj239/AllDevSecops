#Take Username as Input and check if the user already exists
#if the user dont exists ,create user and genrate random password
#India@<random><spec>
#Force the user to reset the password on the first login

#!/bin/bash
while true; do
    read -p " Please enter the name of the user You like to create :" USERNAME
    echo $USERNAME
    EXISTING_USER=$(cat /etc/passwd | grep -i -w $USERNAME | cut -d ":" -f 1)
    if [ "${EXISTING_USER}" = "${USERNAME}" ]; then
        echo "The Username $USERNAME already exists..Use a different one"
    else
        echo "User $USERNAME Dont Exist .Lets Create A New User $USERNAME"
        useradd -m $USERNAME --shell /bin/bash
        SPEC=$(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
        PASSWORD="India@${RANDOM}${SPEC}"
        echo "$USERNAME:$PASSWORD" | sudo chpasswd
        passwd -e $USERNAME
        echo "Login with  $USERNAME with passwd  as $PASSWORD"
    fi
done

