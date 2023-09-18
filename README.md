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

- 3.12 [3.12/Dockerfile](3.12/Dockerfile)
- 3.13 [3.13/Dockerfile](3.13/Dockerfile)
- 3.14 [3.14/Dockerfile](3.14/Dockerfile)
- 3.15 [3.15/Dockerfile](3.15/Dockerfile)
- 3.16 [3.16/Dockerfile](3.16/Dockerfile)
- 3.17 [3.17/Dockerfile](3.17/Dockerfile)
- 3.18, latest [3.18/Dockerfile](3.18/Dockerfile)
