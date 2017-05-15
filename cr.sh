# A quick way to cd into a repository found in your $GITREPOS_PATH
cr()
{
    : ${1:?missing directory}

    local pathname="$(_cr_complete --eager $1)"
    [[ ${pathname} ]] && cd "${pathname}" || echo "unable to complete repo name"
}


# Auto completion for cr
_cr_complete()
{
    local eager
    local -a index=0
    local path
    local repo

    [[ $1 == --eager ]] && eager=1

    for path in $(tr : ' ' <<< ${GITREPOS_PATH})
    do
        for repo in $(ls ${path})
        do
            [[ -z $2 || -n $(grep "$2" <<< ${repo}) ]] || continue
            if [[ ${eager} ]]
            then
                echo "${path}/${repo}"
                return
            else
                COMPREPLY[${index}]="${repo}"
                index=$(( ${index} + 1 ))
            fi
        done
    done
}


complete -F _cr_complete cr
