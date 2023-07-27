import jenkins.model.*
import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.common.*
import com.cloudbees.plugins.credentials.domains.*
import com.cloudbees.plugins.credentials.impl.*

def createCredentials() {
    def credentialsStore = Jenkins.instance.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0].getStore()
    def domain = Domain.global()
    
    def credentials = new UsernamePasswordCredentialsImpl(
        CredentialsScope.GLOBAL,
        "creds",
        "Credentials",
        "admin",
        "admin"
    )
    
    credentialsStore.addCredentials(domain, credentials)
}

createCredentials()