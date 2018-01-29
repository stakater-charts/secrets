# chart-secrets

This chart is used to apply secrets. You can specify any number of secrets and any number of values inside a secret. You have to use the following format to specify secrets:

```bash
- name: someName
      values:
        - key: hello
          value: world
        - key: key2
          value: value2
      type: someType
- name: secret2
      values:
        - key: someKey
          value: someValue
```

For installing the chart, run the following command:

```bash
helm install chartmuseum/chart-secrets -f values.yaml --namespace <namespace-name> --name <name>
```