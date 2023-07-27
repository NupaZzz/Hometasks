import jenkins.model.*
import hudson.security.*

def jenkins = Jenkins.getInstance()
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount("{{ jenkins_admin_username }}", "{{ jenkins_admin_password }}")
jenkins.setSecurityRealm(hudsonRealm)
jenkins.save()