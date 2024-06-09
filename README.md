# my-git-bisect
My approach to create smth like git-bisect 
## Usage
1. clone this repo 
2. clone test repo https://github.com/SteveStevenpoor/cpp-diff
3. `cp test.sh test_repo`
4. run `sh my_bisect.sh absolute_path_to_test_repo test.sh`

It will find the first broken commit
