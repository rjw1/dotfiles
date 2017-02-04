for key in ghe github personal govuk-production govuk-staging govuk-integration
do
  alias delete-${key}-key="ssh-add -d ~/.ssh/id_rsa.4096.${key}"
done
