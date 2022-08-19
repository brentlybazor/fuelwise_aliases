# CHECKOUT BRANCHES

# checkout the feature branch
# first param is the ticket number, second param is the '-b' incase you need to create a new branch
fw-gcf () {
    __branch-exists-check "feature/FWV-${1}"
}

# checkout the release branch
# first param is the ticket number, second param is the '-b' incase you need to create a new branch
gcr () {
    __branch-exists-check "release/${1}"
}

# checkout the bugfix branch``
# first param is the ticket number, second param is the '-b' incase you need to create a new branch
fw-gcbf () {
    __branch-exists-check "bugfix/FWV-${1}"
}

# PUSH BRANCHES

# upstream alias (this takes out the requirement to type out feature/FWV-)
# first param is the ticket number/name
fw-gpf () {
    git push --set-upstream origin "feature/FWV-${1}"
}

# upstream alias (this takes out the requirement to type out release/)
# first param is the ticket number/name
gpr () {
    git push --set-upstream origin "release/${1}"
}

# upstream alias (this takes out the requirement to type out bugfix/FWV-)
# first param is the ticket number/name
fw-gpbf () {
    git push --set-upstream origin "bugfix/FWV-${1}"
}

gpup () {
    git push --set-upstream origin "${1}"
}

__branch-exists-check () {
    branch_name=$1
    branch_exists=false
    create_branch='n'
    if [[ $branch_name = $(git branch --show-current) ]]
    then
        echo "Currently on $branch_name branch."
        branch_exists=true
    fi

    if [[ "$branch_exists" = false ]] && [ `git branch --list $branch_name` ];
    then
        echo "Branch name $branch_name already exists."
        branch_exists=true
    fi

    if [[ "$branch_exists" = false ]]
    then
        read -p 'Want to create this branch?[y/n]' create_branch
    else
        git checkout $branch_name
    fi

    if [[ "$create_branch" = 'y' ]]
    then
        echo 'creating branch'
        git checkout -b $branch_name
    fi 
}