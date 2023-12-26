### Model C --> CodeCompletion Model [WizardCoder3b]

## Setup



First install the requirements
```sh
pip install -r requirements.txt
```

Next download the model weight 

```sh
python download_model.py
```

Now run the script

```sh
python inference.py
```

# Run using Docker

```sh
docker build -t modelC .
```

```sh
docker run -it modelC
```
