#!/bin/sh
# ########################################################################## #
#                                                                            #
#                                                        :::      ::::::::   #
#   allowed_function.sh                                :+:      :+:    :+:   #
#                                                    +:+ +:+         +:+     #
#   By: GlaceCoding <github.com/GlaceCoding>       +#+  +:+       +#+        #
#                                                +#+#+#+#+#+   +#+           #
#   Created: 2021/10/13 12:10:10 by GlaceCoding       #+#    #+#             #
#   Updated: 2021/10/13 12:52:31 by GlaceCoding      ###   ########.fr       #
#                                                                            #
# ########################################################################## #

cd "$(git rev-parse --show-cdup)"

FOLDER_C_FILES="./ex*"

find . -type f -iname "*.c" -path "$FOLDER_C_FILES" -execdir gcc -c -fno-builtin -fno-stack-protector {} ";"

if [ "Darwin" == "$(uname -s)" ]; then
	used=$(find . -type f -iname "*.o" -path "$FOLDER_C_FILES" -execdir nm -uA {} ";" | sed 's/\(.*\): \_/\1:/g' | sed 's/\.o:/.c:/')
else
	used=$(find . -type f -iname "*.o" -path "$FOLDER_C_FILES" -execdir nm -uA {} ";" | sed 's/.\/\(.*\): *U /\1:/g' | sed 's/\.o:/.c:/')
fi

echo "$used"
for scope in $used; do
	match=$(grep -Fx "$scope" .allowed_function)

	if [ "$match" != "$scope" ]; then
		fcname=$(echo "$scope" | cut -d ":" -f2)
		match=$(grep -Fx "*:$fcname" .allowed_function)
		if [ "$match" != "*:$fcname" ]; then
			echo -e "KO.\nForbidden function $fcname:\n\n\t$scope"
			exit 1
		fi
	fi
done

exit 0
