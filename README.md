## Submission Manager

A submission manager which enables solutions to output-only problems to be run on a remote server instead of locally.  

## Usage

1. Clone the repository onto the server.
2. Run `init.sh` to initialize all folders.
3. All executables placed inside the folder `submit` will be run against all input cases in `input` and the output will appear in `output`.
4. Provide an executable and place it inside the folder `grade`. This ensures only the best output for each input case is retained.
