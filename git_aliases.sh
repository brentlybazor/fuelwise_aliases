# CHECKOUT BRANCHES

# checkout the feature branch
# first param is the ticket number, second param is the '-b' incase you need to create a new branch
gcf () {
    git checkout ${2} "feature/FWV-${1}"
}

# checkout the release branch
# first param is the ticket number, second param is the '-b' incase you need to create a new branch
gcr () {
    git checkout ${2} "release/${1}"
}

# checkout the bugfix branch``
# first param is the ticket number, second param is the '-b' incase you need to create a new branch
gcbf () {
    git checkout ${2} "bugfix/FWV-${1}"
}

# PUSH BRANCHES

# upstream alias (this takes out the requirement to type out feature/FWV-)
# first param is the ticket number/name
gpf () {
    git push --set-upstream origin "feature/FWV-${1}"
}

# upstream alias (this takes out the requirement to type out release/)
# first param is the ticket number/name
gpr () {
    git push --set-upstream origin "release/${1}"
}

# upstream alias (this takes out the requirement to type out bugfix/FWV-)
# first param is the ticket number/name
gpbf () {
    git push --set-upstream origin "bugfix/FWV-${1}"
}

gpup () {
    git push --set-upstream origin "${1}"
}

