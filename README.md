<h1>How To install:</h1>
<ul>1. Go to the releases page: https://github.com/Firepixel85/Tasker/releases</ul>
<ul>2. Select the correct version according to your OS </ul>
<ul>3. Download the .exe or .zip file (with prefix Tasker)</ul>
<ul>4. Run the file you downloaded
  <li>On Windows in the windows defender pop-up, click "More Info" and then "Run Anyway"</il>
  <li>On Mac open setting go to security settings click "Open Anyway" and enter your password</il>
</ul>
<ul>5. The app should now open with no problem</ul>

<h1>Documentation:</h1>(As of version 0.1)

<h2>Data directory (user path)</h2>
Tasker saves all its data in its user path, which for Windows is located at <code>C:\Users\"username"\AppData\Roaming\Godot\app_userdata\Tasker</code> remember to change "username" to your username, for Mac path is <code>~/Library/Application Support/Tasker</code>

<h2>Understanding the data storage structure</h2>
When you open the user you will see 2 folder, you can ingnore those and you will also see 11 <code>.json</code> files. 

  <li>
    Files with the <code>savetask</code> prefix and then a numbers (1-10) are where your task data is stored, their structure goes as such:<code>{"done":false,"loccolor":"1","locicon":"1","locname":"example"}</code>, <code>locname</code> is the task's name        (type: <code>string</code>),  <code>locicon</code> is the task's icon (type <code>int</code>, range 1-10),  <code>loccolor</code> is the task's color (type <code>int</code>, range 1-6),    <code>done</code> defines if the task is done.
  </li>
  <ul>   </ul>
  <li>
    The <code>savetime.json</code> has the following structure: <code>{"lastlogd":"03","lastlogt":"19:36:41","taskDB":{"1":1,"10":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0,"8":0,"9":0}}</code>,   <code>lastlogd</code> contains the day you last opened the program (type: <code>int</code>),   <code>lastlogt</code> contains the time you last opened the program (type: <code>int</code>), <code>taskDB</code> is a database all scripts may access to determin which tasks are active (active = shown to the user) (type <code>dictionary</code>, stucture: <code>"x":1</code>
where x = the task's number/ID and 1 = active or 0 = inactive 
  </li>
