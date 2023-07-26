import jenkins.model.*
import hudson.security.*

def jenkins = Jenkins.getInstance()
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount("admin", "admin")
jenkins.setSecurityRealm(hudsonRealm)
jenkins.save()