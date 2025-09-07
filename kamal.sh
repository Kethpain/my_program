#!/bin/bash


if [ "$EUID" -ne 0 ]; then
    echo "You are not a root privillege. This situation has been reported"
    exit 1
fi

soruce func/alter.sh
soruce func/create-user.sh
source func/delete-user.sh
source func/find-valid-users.sh
source func/help_message.sh
source func/find-user-files.sh

COMMAND="$1"
ARG="$2"

if [ "$COMMAND" = "find-valid-users" ]; then
    find_valid_users

elif [ "$COMMAND" = "find-user-files" ]; then
    find_user_files "$ARG"

elif [ "$COMMAND" = "create-user" ]; then
    create_user

elif [ "$COMMAND" = "delete-user" ]; then
    delete_user

elif [ "$COMMAND" = "alter" ]; then
    alter

elif [ "$COMMAND" = "search" ]; then
    search_string

elif [ "$COMMAND" = "--help" ] || [ "$COMMAND" = "-h"]; then
    help_message

else
    echo "wrong command! For more information use "kamal.sh --help" or "kamal.sh -h" "
    exit 1
fi
