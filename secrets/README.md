# secrets

## install
```sh
brew install sops
```

## sops
```sh
make terraform.sops.decrypt.all
```

1. `make terraform.sops.decrypt.{env}`を実行する
2. `secrets/environments/${env}/secrets.yaml`を編集する
3. `make terraform.sops.encrypt.{env}`を実行する
4. `make terraform.plan.{env}`を実行する
5. `make terraform.apply.{env}`を実行する
