# alpine-ssh-client

A little docker image based on alpine with ssh-client and bash

## using from GitLab CI

```yml
deploy_staging:
  stage: deploy
  image: kroniak/ssh-client
  environment:
    name: staging
    url: https://sample-app.net
  script:
    - mkdir -p ~/.ssh
    - chmod 700 ~/.ssh
    - echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
    - echo "$SSH_PRIVATE_KEY_STAGING" > ~/.ssh/id_rsa
    - chmod 600 ~/.ssh/id_rsa
    - scp -r deploy/app_staging/. $DEPLOY_STAGING_SSH_HOST:~/app
    - scp -r src/project/conf/. $DEPLOY_STAGING_SSH_HOST:~/app/conf
    - ssh $DEPLOY_STAGING_SSH_HOST 'chmod 700 ~/app/app.sh'
    - ssh $DEPLOY_STAGING_SSH_HOST 'cd ~/app && ./app.sh --file docker-compose-staging.yml up'
    - ssh $DEPLOY_STAGING_SSH_HOST 'cd ~/app && ./app.sh --file docker-compose-staging.yml update'
  only:
    - dev
```

## using from docker

`docker run -it --rm kroniak/ssh-client bash`

## supported tags and respective Dockerfile links

- 3.1 [3.1/Dockerfile](https://github.com/kroniak/alpine-ssh-client/blob/master/3.1/Dockerfile)
- 3.6 [3.6/Dockerfile](https://github.com/kroniak/alpine-ssh-client/blob/master/3.6/Dockerfile)
- 3.9 [3.9/Dockerfile](https://github.com/kroniak/alpine-ssh-client/blob/master/3.9/Dockerfile)
- 3.10 [3.10/Dockerfile](https://github.com/kroniak/alpine-ssh-client/blob/master/3.10/Dockerfile)
- 3.11, latest [3.11/Dockerfile](https://github.com/kroniak/alpine-ssh-client/blob/master/3.11/Dockerfile)
