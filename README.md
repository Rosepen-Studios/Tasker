<h1>How To install:</h1>
<ul>1. Go to the releases page: https://github.com/Firepixel85/Tasker/releases</ul>
<ul>2. Select the correct version according to your OS </ul>
<ul>3. Download the .exe or .zip file (with prefix Tasker)</ul>
<ul>4. Run the file you downloaded
 - <li>On Windows in the windows defender pop-up, click "More Info" and then "Run Anyway"</il>
 - <li>On Mac open setting go to security settings click "Open Anyway" and enter your password</il>
</ul>
<ul>5. The app should now open with no problem</ul>

<h1>Documentation:</h1>(As of version 0.2.2)

<h2>Data directory (user path)</h2>
Tasker saves all its data in its user path, which for Windows is located at <code>C:\Users\"username"\AppData\Roaming\Godot\app_userdata\Tasker</code> remember to change "username" to your username, for Mac path is <code>~/Library/Application Support/Godot/app_userdata/Tasker</code>

<h2>Understanding the data storage structure</h2>
When you open the user you will see 2 folder, you can ingnore those and you will also see 12 <code>.json</code> files. 

  <li>
    Files with the <code>savetask</code> prefix and then a numbers (1-10) are where your task data is stored, their structure goes as such:<code>{"done":false,"loccolor":"1","locicon":"1","locname":"example"}</code>, <code>locname</code> is the task's name        (type: <code>string</code>),  <code>locicon</code> is the task's icon (type <code>int</code>, range 1-10),  <code>loccolor</code> is the task's color (type <code>int</code>, range 1-6),    <code>done</code> defines if the task is done.
  </li>
  <ul>   </ul>
  <li>
    The <code>savetime.json</code> file has the following structure: <code>{"lastlogd":"03","lastlogt":"19:36:41","taskDB":{"1":1,"10":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0,"8":0,"9":0}}</code>,   <code>lastlogd</code> contains the day you last opened the program (type: <code>int</code>),   <code>lastlogt</code> contains the time you last opened the program (type: <code>int</code>), <code>taskDB</code> is a database all scripts may access to determin which tasks are active (active = shown to the user) (type <code>dictionary</code>, stucture: <code>"x":1</code>
where x = the task's number/ID and 1 = active or 0 = inactive 
  </li>
  <li>
   The <code>config.json</code> file is used to enable certain features not ment for normal use. (Such features will be mentioned further below.) This is the structure the file follows: <code>{"devmode":true}</code>, where "feature" is the feature you are trying to toggle (In this case <code>devmode</code>) and it is a bool where <code>true</code> means the feature is anabled and <code>false</code> means the opposite.
  </li>
  <h2>Overriding</h2>
  As of the currunt version of Tasker you can only override the background to any picture of your choosing.
  <h3>How to Override the background:</h3>
  <ul>1. Open <strong>The Data Directory Path</strong>. (look at the <strong>Data directory</strong> on how to do that)</ul>
  <ul>2. Select the image you want to use as your new background. (16:9 aspect ratio ensures no streching, Supported formats are: .png .jpg and .jpeg)</ul>
  <ul>3. Rename the image to <strong>bg</strong>.</ul>
  <ul>4. Place the Image in the <strong>The Data Directory Path</strong>.</ul>
  <ul>5. Restart Tasker and you are done!</ul>
  <h2>Developer Mode</h2>
  Developer Mode is a feature that can be turned on externaly and was programed to help with testing and debuging Tasker. It is essentially a console that accepts custom commands that have can control the app on provide information.
  <h3>How to enable Developer Mode:</h3>
