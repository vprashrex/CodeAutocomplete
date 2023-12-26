### Model A --> CodeCompletion Model [Starcoder]

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
docker build -t modelA .
```

```sh
docker run -it modelA
```
