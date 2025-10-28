# !/bin/zsh


# get info from terminal from user
get_info(){
echo "Please enter username:" 
read your_username 
echo "Please enter your ssh hostname:"
read ssh_hostname
} 

# copy data with scp
copy_data(){
    local name=$1
    local host=$2
    current_dir=$(pwd)
    vim_config=".vimrc"
    zsh_config=".config.sh"
    slash="/"
    current_file_path_vim="$current_dir$slash$vim_config" 
    current_file_path_zsh="$current_dir$slash$zsh_config" 
    ssh_file_path="/home/$name/"

    echo $name 
    echo $host
    echo $current_dir
    echo $current_file_path_vim
    echo $current_file_path_zsh
    echo "ssh_file_path: $ssh_file_path"   
 
    scp "$current_file_path_vim" "$name@$host:$ssh_file_path"
    scp "$current_file_path_zsh" "$name@$host:$ssh_file_path"

}    

get_info 
copy_data $your_username $ssh_hostname


