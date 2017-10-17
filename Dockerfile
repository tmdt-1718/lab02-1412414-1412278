from ruby
run apt-get update -y
run apt-get install -y build-essential patch ruby-dev zlib1g-dev liblzma-dev nodejs
run mkdir lab02
workdir /lab02
expose 3000
add . /lab02
run bundle install
