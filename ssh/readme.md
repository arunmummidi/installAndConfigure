# SSH Key based Authenication

Easiest way is by using ssh-keygen & ssh-copy-id. In case, you are not able to use these tools, then here are simple steps to configure SSH keys and customize your prompt.

# Steps

  - Copy **configure_key_auth.sh** and **profile_config** files to your home directory
  - Switch to your home directory and run 
  
       ```sh
      $ sh configure_key_auth.sh <remote_server hostname>
    ```
