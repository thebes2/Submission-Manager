## Submission Manager

A submission manager which enables solutions to output-only problems to be run on a remote server instead of locally.  

## Usage

1. Clone the repository onto the server.
2. Run `init.sh` to initialize all folders.
3. All executables placed inside the folder `submit` will be run against all input cases in `input` and the output will appear in `output`.
4. Provide an executable and place it inside the folder `grade`. This ensures only the best output for each input case is retained. This executable should accept two arguments: the paths of the two output files to be compared and return `0` if the second output should be kept and any return any non-zero value if the first output should be kept. 

## Examples

- There is a sample grader executable in the folder `grade`. It reads in the first value in each output file and keeps the file with the larger value. The C++ file that was compiled into this executable is `examples/grader.cpp`. 
