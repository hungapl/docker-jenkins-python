# Jenkins JNLP Slave for building and deploying python packages
A Docker image for running a Jenkins slave agent with python 3.7 installed.
This environment is designed to support building, package and deploying python packages to a pypi repository.

Starts a container:
```
docker run --env TWINE_REPOSITORY_URL=<repo_url> [OTHER_DOCKER_OPTIONS] ahung06/jenkins-slave-python3  -url ```
http://jenkins-server:port <secret> <agent name>
```

Add the following arguments to the above command (replacing [OTHER_DOCKER_OPTIONS]) if credentials are required for uploading to pypi:
```
--env TWINE_USERNAME=<repo_username> --env TWINE_PASSWORD=<repo_password>
```
Refer to [twine documentation](https://github.com/pypa/twine) for more configuration options.

In the **Build** step of the Jenkins job, add these mshell commands to run for for packaging and deploying a python package:
```
python3 setup.py sdist
python3 -m twine upload dist/*.tar.gz
```
The *setup.py* should reside in the parent directory of your python package directory.  This script defines how to package your python files using setuptools.  More information on how to use setuptools can be found [here](https://setuptools.readthedocs.io/en/latest/setuptools.html).



### Optional: Use Jenkins Shining Panda plugin 
The [Shining Panda](https://wiki.jenkins.io/display/JENKINS/ShiningPanda+Plugin) plugin includes a number of builders you may find useful.  For example, you can configure which python installation is available on the agent (if there are more than one versions of python installed) and choose which version to use in the Python builder.  
There is the option to execute python code in this builder (by selecting 'Python' in the 'Nature' option).
This plugin also support running your build script in a python **virtualenv**.
