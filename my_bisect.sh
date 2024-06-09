# get cl args as an array
args=("$@")

# cd into given git repo
cd ${args[0]}

# get all the commits hashes
hashes=()
mapfile -t hashes < <( git log --pretty=format:%h )

# binary search
target=$1
left=0
right=$((${#hashes[@]} - 1))
while [[ $left -le $right ]]; do
  mid=$((($left + $right) / 2))
  git checkout ${hashes[$mid]} > /dev/null 2>&1
  sh ${args[1]} > /dev/null 2>&1
  rv=$?
  echo The error code on branch ${hashes[$mid]} is $rv
  if [[ $rv -ne 0 ]]; then
    left=$((mid + 1))
  else
    right=$((mid - 1)) 
  fi
done

echo ${hashes[$right]} is the first bad commit
