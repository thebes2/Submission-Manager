## Submission Manager

A submission manager which enables solutions to output-only problems to be run on a remote server instead of locally. It also manages output files and automatically selects the best solution to each test case. 

## Usage

### Server   

1. Run the command
```shell
git clone \
	--depth 1 \
	--filter=blob:none \
	--no-checkout \
	https://github.com/thebes2/Submission-Manager.git
cd "Submission Manager"
git checkout master -- server
cd server
```
2. Run `init.sh` to initialize folders and configurations.
3. Executables placed inside the folder `submit` will be run against all input cases in `input` and the output will appear in `output`. They will be removed after being run to prevent the same program from being run multiple times.
4. Place an executable inside the folder `grade` for determining which output file is the best solution so far. This executable should accept two arguments: the paths of the two output files to be compared and should return `0` if the second output should be kept and any return any non-zero value if the first output should be kept. 
5. You may need to run `find . -type f -exec chmod 755 {} \;` to allow the shell scripts to be executed. 

### Local Machine

1. Run the command
```shell
git clone \
	--depth 1 \
	--filter=blob:none \
	--no-checkout \
	https://github.com/thebes2/Submission-Manager.git
cd "Submission Manager"
git checkout master -- client 
cd client
```
2. Run `init.sh` with the argument `user@server:/path/to/submit/` to set the path to the `submit` folder on the server.
3. Run `submit.sh` with the argument `file` which is the executable or `.cpp` file you want to run on the server.
4. Run `solution.sh` to get a zip file of the best solutions to each input in the current directory.  

## Examples

- There is a sample grader executable in the folder `server/grade`. It reads in the first value in each output file and keeps the file with the larger value. The C++ file that was compiled into this executable is `server/examples/grader.cpp`. 
