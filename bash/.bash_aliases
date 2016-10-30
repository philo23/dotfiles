# Disable my bad practice of using vi instead of vim...
alias vi='echo "use vim instead"'
alias tmux='tmux -2'

alias sslcheckcrt='openssl x509 -text -noout -in'
alias sslcheckkey='openssl rsa -check -in'
alias sslcheckcsr='openssl req -text -noout -verify -in'
