from jenkinsapi.jenkins import Jenkins

username='admin'
password='admin'
git_repository='https://github.com/wickett/word-cloud-generator'
server = Jenkins('http://192.168.30.10:8080', username=username, password=password,use_crumb=True)

def create_job():
    job_name = 'world-cloud-generator'
    code = '''
    sed -i &quot;s/1.DEVELOPMENT/1.$BUILD_NUMBER/g&quot; static/version
    GOOS=linux GOARCH=amd64 go build -o ./artifacts/word-cloud-generator -v 
    md5sum artifacts/word-cloud-generator
    gzip artifacts/word-cloud-generator
    ls -l artifacts/
    '''

    job_config = f'''
    <project>
    <actions/>
  <description></description>
  <keepDependencies>false</keepDependencies>
  <properties>
    <jenkins.model.BuildDiscarderProperty>
      <strategy class="hudson.tasks.LogRotator">
        <daysToKeep>-1</daysToKeep>
        <numToKeep>-1</numToKeep>
        <artifactDaysToKeep>-1</artifactDaysToKeep>
        <artifactNumToKeep>-1</artifactNumToKeep>
      </strategy>
    </jenkins.model.BuildDiscarderProperty>
  </properties>
  <scm class="hudson.plugins.git.GitSCM" plugin="git@5.2.0">
    <configVersion>2</configVersion>
    <userRemoteConfigs>
      <hudson.plugins.git.UserRemoteConfig>
        <url>{git_repository}</url>
        <credentialsId>1</credentialsId>
      </hudson.plugins.git.UserRemoteConfig>
    </userRemoteConfigs>
    <branches>
      <hudson.plugins.git.BranchSpec>
        <name>*/master</name>
      </hudson.plugins.git.BranchSpec>
    </branches>
    <doGenerateSubmoduleConfigurations>false</doGenerateSubmoduleConfigurations>
    <submoduleCfg class="empty-list"/>
    <extensions/>
  </scm>
  <canRoam>true</canRoam>
  <disabled>false</disabled>
  <blockBuildWhenDownstreamBuilding>false</blockBuildWhenDownstreamBuilding>
  <blockBuildWhenUpstreamBuilding>false</blockBuildWhenUpstreamBuilding>
  <triggers/>
  <concurrentBuild>false</concurrentBuild>
  <builders>
    <hudson.tasks.Shell>
      <command>{code}</command>
      <configuredLocalRules/>
    </hudson.tasks.Shell>
  </builders>
  <publishers/>
  <buildWrappers>
    <org.jenkinsci.plugins.golang.GolangBuildWrapper plugin="golang@1.4">
      <goVersion>Go lang</goVersion>
    </org.jenkinsci.plugins.golang.GolangBuildWrapper>
  </buildWrappers>
</project>
'''

    server.create_job(job_name, job_config)
    server.build_job(job_name)

if __name__ == "__main__":
    create_job()