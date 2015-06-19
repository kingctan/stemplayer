<h2>Stem Reference - Version 0.7</h2>
<p>This section contains a reference for all STEM elements, in the order that they<br>
appear in the stem.xml document. The class tree for the elements is shown below.</p>

<img src='http://stemplayer.googlecode.com/svn/wiki/element.png' width='549' height='324'>
<br>

<h1>Stem Reference:</h1>
<ul><li>[<a href='#<stem>.md'>stem</a>]<br>
<ul><li>[<a href='#<space>.md'>space</a>]<br>
<ul><li><a href='#<background>.md'>background</a>
</li></ul></li><li>[<a href='#<message>.md'>message</a>]<br>
<ul><li><a href='#<padding>.md'>padding</a>
</li><li><a href='#<finalscore>.md'>finalscore</a>
</li><li><a href='#<finalfactors>.md'>finalfactors</a>
</li></ul></li><li>[<a href='#<factors>.md'>factors</a>]<br>
<ul><li><a href='#<factor>.md'>factor</a>
</li></ul></li><li>[<a href='#<reports>.md'>reports</a>]<br>
<ul><li><a href='#<report>.md'>report</a>
</li></ul></li><li>[<a href='#<interaction>.md'>interaction</a>]<br>
<ul><li><a href='#<name>.md'>name</a>
</li><li><a href='#<visual>.md'>visual</a>
</li><li>[<a href='#<statements>.md'>statements</a>]<br>
<ul><li>[<a href='#<statement>.md'>statement</a>]<br>
<ul><li><a href='#<reaction>.md'>reaction</a>
</li><li>[<a href='#<responses>.md'>responses </a>]<br>
<ul><li>[<a href='#<choices>.md'>choices</a>]<br>
<ul><li>[<a href='#<scores>.md'>scores</a>]<br>
<ul><li><a href='#<factor>.md'>factor</a>
</li></ul></li></ul></li></ul></li></ul></li></ul></li></ul></li><li>[<a href='#<helper>.md'>helper</a>]<br>
<ul><li><a href='#<help>.md'>help</a></li></ul></li></ul></li></ul>

<br>
Because the files are in XML grammar and file format, tag names are casesensitive<br>
and must appear exactly as shown here: <br>

<h1><code>&lt;stem&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;stem&gt;<br>
&lt;/stem&gt;<br>
</code></pre>
<h2>Description</h2>
This is the root element; all other elements must be contained inside it.<br>
<br>
<h1><code>&lt;space&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;space&gt;<br>
  &lt;background src="media/foyer.swf" x="0" y="0"&gt; &lt;/background&gt;<br>
&lt;/space&gt;<br>
</code></pre>

<h2>Description</h2>
The <b>space</b> element specifies where the interaction occurs. In a future version, this<br>
element might be used to define rooms and other spaces.<br>
<br>
<h2>Children</h2>
<a href='#<background>.md'>&lt;background&gt;</a>
<h1><code>&lt;background&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;space&gt;<br>
 &lt;background src="media/foyer.swf" x="0" y="0"&gt; &lt;/background&gt;<br>
&lt;/space&gt;<br>
</code></pre>

<h2>Description</h2>
The <b>background</b> element specifies the background image or media for the<br>
interaction. Often, this is used to place an image of a room or other space in the<br>
background of an interaction.<br>
<br>
<h2>Attributes</h2>
<ul>
<li> <b>src</b> Is the relative path for the background. This path is relative to the stem.swf file,<br>
not the stem.xml file in the data folder. The file can be in any image format that<br>
Flash supports, e.g. .swf, .jpg, .png. Because .swf files can be used, animation,<br>
sound and other interactions can be added to the background.</li>
<li> <b>x</b> The x position of the background. This is normally set to 0.</li>
<li> <b>y</b> The y position of the background. This is normally set to 0.</li>
</ul>

<h2>Parent</h2>
<a href='#<space>.md'>&lt;space&gt;</a>
<h1><code>&lt;messages&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;messages&gt;<br>
  &lt;padding x="10"&gt;&lt;/padding&gt;<br>
  &lt;finalscore x="420" y="50" displayduring="yes"&gt;Score&lt;/finalscore&gt;<br>
  &lt;finalfactors display="no"&gt;&lt;/finalfactors&gt;<br>
&lt;/messages&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>message</b> element contains the other elements that control the scoring and<br>
feedback systems of STEM.<br>
<br>
<h2>Children</h2>
<a href='#<padding>.md'>&lt;padding&gt;</a><br>
<a href='#<finalscore>.md'>&lt;finalscore&gt;</a><br>
<a href='#<finalfactors>.md'>&lt;finalfactors&gt;</a><br>
<h1><code>&lt;padding&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;messages&gt;<br>
  &lt;padding x="10"&gt;&lt;/padding&gt;<br>
  &lt;finalscore x="420" y="50" displayduring="yes"&gt;Score&lt;/finalscore&gt;<br>
  &lt;finalfactors display="no"&gt;&lt;/finalfactors&gt;<br>
&lt;/messages&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>padding</b> element controls how much visual space there is between each of the<br>
parts in final the feedback display, e.g. the bar charts show the scores. These<br>
elements are stacked vertically, and the padding element only controls the padding<br>
between the vertical elements.<br>
<br>
<h2>Attributes</h2>
<li><b>x</b> The amount of vertical padding between parts in the message box. This is normally set to 10.</li>

<h2>Parent</h2>
<a href='#<messages>.md'>&lt;messages&gt;</a>
<h1><code>&lt;finalscore&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;messages&gt;<br>
  &lt;padding x="10"&gt;&lt;/padding&gt;<br>
  &lt;finalscore x="420" y="50" displayduring="yes"&gt;Score&lt;/finalscore&gt;<br>
  &lt;finalfactors display="no"&gt;&lt;/finalfactors&gt;<br>
&lt;/messages&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>finalscore</b> element controls the visual position of the score message, when the<br>
messages are shown and what the score is labelled.<br>
<br>
<h2>Example</h2>
<pre><code>&lt;finalscore x="420" y="50" displayduring="yes"&gt;Progress&lt;/finalscore&gt;<br>
</code></pre>
In this example, the score is shown in the top right hand corner with the word<br>
progress showing during the whole interaction.<br>
<br>
<h2>Example</h2>
<pre><code>&lt;finalscore x="420" y="50" displayduring="no"&gt;Score&lt;/finalscore&gt;<br>
</code></pre>
The score is shown in the top right hand corner only when the end branch is<br>
chosen by the user and the word <b>Score</b> is used in the label.<br>
<br>
<h2>Attributes</h2>
<ul>
<li><b>x</b> The x position of the score.</li>
<li><b>y</b> The y position of the score.</li>
<li><b>displayduring</b>. This can be set to yes or no. If you only want the score to show at<br>
the end, it should be set to <b>displayduring=no</b>.</li>
</ul>

<h2>Parent</h2>
<a href='messages'><code>&lt;messages&gt;</code></a>
<h1><code>&lt;finalfactors&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;messages&gt;<br>
  &lt;padding x="10"&gt;&lt;/padding&gt;<br>
  &lt;finalscore x="420" y="50" displayduring="yes"&gt;Score&lt;/finalscore&gt;<br>
  &lt;finalfactors display="no"&gt;&lt;/finalfactors&gt;<br>
&lt;/messages&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>finalfactors</b> element controls if feedback is given on how the user's choices performed against each of the factors that are defined. STEM will create simple bar graphs for each of these factors, at the end of the interaction. There is more about the factors feature of STEM below.<br>
<br>
<h2>Attributes</h2>
<li> <b>display</b> This can be set to yes or no. If you only want the score to show at the<br>
end, it should be set to <b>displayduring=no</b>.</li>

<h2>Parent</h2>
<a href='#<messages>.md'>&lt;messages&gt;</a>
<h1><code>&lt;factors&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;factors&gt;<br>
  &lt;factor&gt;Customer Service&lt;/factor&gt;<br>
  &lt;factor&gt;Technical&lt;/factor&gt;<br>
&lt;/factors&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>factors</b> element contains other elements that define how the scoring system<br>
works. Each choice a user makes has a score for each of the factors. This means that they might be able to make a choice that has a high score for customer service but is not technically correct. In that case, the score for the customer service factor would go up and the technical factor score would go down. The overall score is a combination of all the scores from all the factors. The report shown at the end shows how the user got on against factors. Every choice needs to be rated for all the factors.<br>
<br>
There are no limits to the amount of factors, but 3 seems to be a good amount to work with.<br>
<br>
<h2>Children</h2>
<a href='#<factor>.md'>&lt;factor&gt;</a>
<h1><code>&lt;factor&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>  &lt;factor&gt;Technical&lt;/factor&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>factor</b> element simply contains the name of each of scoring factor. For more about factors see <a href='#<factors>.md'>factors</a> above.<br>
<br>
<h2>Parent</h2>
<a href='#<factors>.md'>&lt;factors&gt;</a>
<h1><code>&lt;reports&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;reports&gt;<br>
  &lt;report&gt;&lt;/report&gt;<br>
&lt;/reports&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>reports</b> element contains the report elements that define how the score is reported at the end.<br>
<br>
<br>
<h2>Children</h2>
<a href='#<report>.md'>&lt;report&gt;</a>
<h1><code>&lt;report&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;reports&gt;<br>
  &lt;report&gt;scorm&lt;/report&gt;<br>
&lt;/reports&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>report</b> specifics how the score is reported. The default value is blank, and the score is only shown to the user.<br>
<br>
<h2>Possible values</h2>
<b>scorm</b> - When this is set, the following is reported to the Learning Management System via SCORM:<br>
<ul>
<li> The total final score.</li>
<li> The score for each of the factors.</li>
<li> The choices the users made.</li>
</ul>
For the SCORM reporting to work, the SCORM_API_wrapper.js needs to be<br>
included in the html. There is an example of how these dependencies work together in main.scorm.html.<br>
<br><br>
This hasn't been extensively tested in multiple Learning Management Systems.<br>
The reports element is also at the end of the setup section of the xml file.<br>
<br>
<h2>Children</h2>
<a href='#<reports>.md'>&lt;reports&gt;</a>
<h1><code>&lt;interaction&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;interaction&gt;<br>
&lt;/interaction&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>interaction</b> element is a container element for the main elements that define the branches and choices. At the moment, STEM is set up for only one interaction element per XML file; in the future it may support multiple interactive elements. The first two children elements <b>name</b> and <b>visual</b> are setup elements.<br>
<br>
<br>
<h2>Children</h2>
<a href='#<name>.md'>&lt;name&gt;</a><br>
<a href='#<visual>.md'>&lt;visual&gt;</a><br>
<a href='#<statements>.md'>&lt;statements&gt;</a><br>
<h1><code>&lt;name&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;interaction&gt;<br>
  &lt;name type ="image" &gt;&lt;/name&gt;<br>
  &lt;visual x="100" y="50"&gt;media/alison.swf&lt;/visual&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>name</b> element is only used to define what type of media the interaction uses.<br>
The actual value of the name is not used at the moment.<br>
<h2>Attributes</h2>
<ul>
<ul> <li>type</li>
<ul> <li>The possible values for type are:</li>
<ul>
<li> <b>image:</b> This is the base for all the types of interaction. The file can be<br>
any image type that flash supports including .swf. If the image is<br>
an .swf, it will play at the end before the responses are shown. An<br>
example of how the image type is the based type is the sound type.<br>
When the sound element is defined, STEM still uses the base image<br>
that is defined in the visual element (see below). STEM will look for an<br>
image attribute in each reaction. If an image is not found with the<br>
reaction element, the image that is shown to the user will not be<br>
changed.</li>
<li> <b>sound:</b> Means that a sound file such as .mp3 can be defined for<br>
each of the reactions. An image still needs be defined in the visual<br>
element.</li>
<li> <b>video:</b> Means that a video file can be defined for each of the<br>
reactions. The video is played and then the choices are shown. There<br>
are no playback controls for video.</li>
</ul>
</ul>
</ul>
</ul>

<h1><code>&lt;visual&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;interaction&gt;<br>
  &lt;name type ="image" &gt;&lt;/name&gt;<br>
  &lt;visual x="100" y="50"&gt;media/alison.swf&lt;/visual&gt;<br>
  &lt;statements&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>visual</b> element is used to define what is shown when the interaction starts. The user clicks on this image, and then the statements start. This can be used to build introduction screens. If later responses don't define new images, then the image that has been set here stays for the whole interaction.<br>
<br>
The path to the file is relative to the stem.swf file. It is suggested that you keep all you images, sounds and video in the media folder.<br>
<br>
<h2>Attributes</h2>
<ul>
<li> <b>x</b>: Sets the x position of the image.</li>
<li> <b>y</b>: Sets the y position of the image.</li>
<li> The height and width are taken from the source file. STEM does not resize images.</li>
</ul>

<h1><code>&lt;statements&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;statements&gt;<br>
  &lt;statement id="0" name="intro" x="200" y="80" &gt;<br>
  &lt;reaction &gt;We are building a new house, a bit out of town and we need to know the cost of getting the power on&lt;/reaction&gt;<br>
    &lt;responses x="0" y="290" width="600" height="140" choiceheight="20"&gt;<br>
        &lt;choice branch="1"&gt;&lt;statement&gt;Do you have pole out the front&lt;/statement&gt;<br>
          &lt;scores&gt;<br>
            &lt;factor name="Supplier Requirements" score="1"&gt;&lt;/factor&gt;<br>
          &lt;/scores&gt;<br>
        &lt;/choice&gt;<br>
     &lt;/responses&gt;<br>
  &lt;/statement&gt;<br>
&lt;/statements&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>statements</b> element is a container for each of the statements/branches. The order and id number statements need to be kept consistent, e.g. you can't have a statement with an id=0 at the end of the list of statements and it expect to work. The numbering system starts from 0.<br>
<br>
The metaphor that STEM uses for its interactions is that there is a series of<br>
statements with reactions and responses. The idea is that STEM has a “reaction”,<br>
and then the user has the choice to “respond“.<br>
<br>
<br>
<h2>Children</h2>
<a href='#<statement>.md'>&lt;statement&gt;</a>
<h1><code>&lt;statement&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;statements&gt;<br>
  &lt;statement id="0" name="intro" help=”0” x="200" y="80" &gt;<br>
  &lt;reaction &gt;We are building a new house, a bit out of town and we need to know the cost of getting the power on&lt;/reaction&gt;<br>
    &lt;responses x="0" y="290" width="600" height="140" choiceheight="20"&gt;<br>
        &lt;choice branch="1"&gt;&lt;statement&gt;Do you have pole out the front&lt;/statement&gt;<br>
          &lt;scores&gt;<br>
            &lt;factor name="Supplier Requirements" score="1"&gt;&lt;/factor&gt;<br>
          &lt;/scores&gt;<br>
        &lt;/choice&gt;<br>
      &lt;/responses&gt;<br>
  &lt;/statement&gt;<br>
&lt;/statements&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>statement</b> element is the container element for each stage of a branch.<br>
<h2>Attributes</h2>
<ul>
<li> <b>id</b>: Each statement needs to be given an id number. These id numbers are used<br>
to make the link between which choice is made and what statement happens next. The id numbers need to start from 0. The order and id number statements need to be keep consistent, e.g. you canʼt have a statement with an id=0 at the end of the list of statements and expect it work.</li>
<li> <b>name</b>: This is not used in STEM at this stage, but it giving each statement a name will make the file easier to read.</li>
<li> <b>help</b>: Is optional and in most case isnʼt used. A setting such as help=”0” means that the help element at the position 0 of the helper element (which is later in the XML file) will be shown. This is often used when the user has made bad choice.</li>
<li> <b>x</b>: Sets the x position of the statement.</li>
<li> <b>y</b>: Sets the y position of the statement.</li>
</ul>

<h2>Children</h2>
<a href='#<reaction>.md'>&lt;reaction&gt;</a><br>
<a href='#<responses>.md'>&lt;responses&gt;</a>
<h1><code>&lt;reaction&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;statements&gt;<br>
  &lt;statement id="0" name="intro" x="200" y="80" &gt;<br>
  &lt;reaction &gt;We are building a new house, a bit out of town and we need to know the cost of getting the power on&lt;/reaction&gt;<br>
    &lt;responses x="0" y="290" width="600" height="140" choiceheight="20"&gt;<br>
        &lt;choice branch="1"&gt;&lt;statement&gt;Do you have pole out the front&lt;/statement&gt;<br>
          &lt;scores&gt;<br>
            &lt;factor name="Supplier Requirements" score="1"&gt;&lt;/factor&gt;<br>
          &lt;/scores&gt;<br>
        &lt;/choice&gt;<br>
      &lt;/responses&gt;<br>
  &lt;/statement&gt;<br>
&lt;/statements&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>reaction</b> element controls what is shown at each of the branches.<br>
<br>
The value reaction element placed in a text box contained in another image. The<br>
image is a ReactBackground.swf file, and this can be modified by changing the<br>
ReactBackground.fla file. The default is a speech bubble. Different media types can<br>
be used as attributes if that type is set in the <b>name</b> element.<br>
<br>
HTML text can be used as a value here as well if it's contained in <b><![CDATA<br>
[“</b><code>&lt;HTML text goes here&gt;</code><b>"]]></b><br>
<br>
The x and y position is taken from the statement element.<br>


<h2>Example</h2>
<pre><code>&lt;reaction &gt;&lt;![CDATA[“&lt;strong&gt;Don’t speak to me like that&lt;/strong&gt;"]]&gt;&lt;/reaction&gt;<br>
</code></pre>
<b>Attributes - all are optional and depend on the type that has been set in the name.</b>
<ul>
<li> <b>image:</b> This is the relative path to an image file. The file type can be any image<br>
format that Flash supports. Not every statement needs an image; if an image is not<br>
defined for a statement then the last image used will remain.</li>
</ul>
<h2>Example</h2>
<pre><code>&lt;reaction image="media/jill.jpg" &gt;Hi &lt;/reaction&gt;<br>
</code></pre>
In this example the image file jill.jpg is loaded and shown, and the text “Hi” is<br>
shown.<br>
<pre><code>&lt;reaction image="media/jill_sayinghi.swf"&gt; &lt;/reaction&gt;<br>
</code></pre>
In this example the image file jill_sayinghi.swf is loaded and shown, but no text is<br>
shown. If the .swf has a timeline, the timeline is played before the responses are<br>
shown, e.g. .swf can be an animation lip-synced to audio.<br>
<ul>
<li> <b>video:</b> This is the relative path to a video file. The file type can be any video<br>
format that Flash supports.</li>
</ul>
<h2>Example</h2>
<pre><code>&lt;reaction video="media/DockingSaw_OP_8_Never_walk_away_while_machine_is_running.f4v" &gt;&lt;/reaction&gt;<br>
</code></pre>
In this example, the video file<br>
DockingSaw_OP_8_Never_walk_away_while_machine_is_running.f4v is played<br>
before the responses are shown. There is no text shown. If the position or size of<br>
the video moves between statements, you may see a white flash.<br>
<ul>
<li> <b>sound:</b> This is the relative path to a sound file. The file type can be any sound<br>
format that Flash supports.</li>
</ul>
<h2>Example</h2>
<pre><code>&lt;reaction sound="media/audio/1went_into_work_job_after40_years.mp3"&gt;&lt;/reaction&gt;<br>
</code></pre>
In this example, the sound file 1went_into_work_job_after40_years.mp3 is played before the responses are shown. There is no text shown.<br>

<h1><code>&lt;responses&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;responses x="0" y="290" width="600" height="140"<br>
choiceheight="20"&gt;<br>
  &lt;choice branch="1"&gt;&lt;statement&gt;Look here, don’t talk to me like that &lt;/statement&gt;<br>
    &lt;scores&gt;<br>
    &lt;factor name="Customers Services" score="-5"&gt;&lt;/factor&gt;<br>
    &lt;factor name="Sales" score="-5"&gt;&lt;/factor&gt;<br>
    &lt;/scores&gt;<br>
  &lt;/choice&gt;<br>
&lt;/responses&gt;<br>
</code></pre>
<h2>Description</h2>
The response element is a container element for the list of choices the user is given at each stage. The choices are listed in a Flash List component. The attributes for the response element set the visual position, and the height and width of that list. The look and feel of this can be changed in the .fla in same way any Flash component can be styled.<br>
<br>
<h2>Attributes</h2>
<ul>
<li> <b>x:</b> Sets the x position of the responses.</li>
<li> <b>y:</b> Sets the y position of the responses.</li>
<li> <b>width:</b> Sets the width of the responses.</li>
<li> <b>height:</b> Sets the height of all the responses.</li>
<li> <b>choiceheight:</b> Sets the height of the actual choices. This is useful when the choices are long and wrap across multiple lines.</li>
</ul>
<h2>Children</h2>
<a href='#<choice>.md'>&lt;choice&gt;</a>
<h1><code>&lt;choice&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;responses x="0" y="290" width="600" height="140" choiceheight="20"&gt;<br>
  &lt;choice branch="1"&gt;&lt;statement&gt;Look here, don’t talk to me like that &lt;/statement&gt;<br>
    &lt;scores&gt;<br>
    &lt;factor name="Customers Services" score="-5"&gt;&lt;/factor&gt;<br>
    &lt;factor name="Sales" score="-5"&gt;&lt;/factor&gt;<br>
    &lt;/scores&gt;<br>
  &lt;/choice&gt;<br>
&lt;/responses&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>choice</b> element is the key element that shows what the choices are and where they go. The branch attribute controls which statement is shown next. <br>
The statement element controls what is shown in the list of choices. <br>
The score element controls how the choice is scored.<br>

<h2>Attributes</h2>
<ul>
<li> <b>branch:</b> This is the number of the next statement. The actual positions are in the list of statements, not the id number you have defined. The other possible value is <b>end</b>. The end value means that the final score will be shown with the messages, and the interaction will be over.</li>
</ul>


<h2>Children</h2>
<a href='#<scores>.md'>&lt;scores&gt;</a><br>
<a href='#<statement>.md'>&lt;statement&gt;</a>
<h1><code>&lt;statement&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;responses x="0" y="290" width="600" height="140" choiceheight="20"&gt;<br>
  &lt;choice branch="1"&gt;&lt;statement&gt;Look here, don’t talk to me like that &lt;/statement&gt;<br>
    &lt;scores&gt;<br>
    &lt;factor name="Customers Services" score="-5"&gt;&lt;/factor&gt;<br>
    &lt;factor name="Sales" score="-5"&gt;&lt;/factor&gt;<br>
    &lt;/scores&gt;<br>
  &lt;/choice&gt;<br>
&lt;/responses&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>statement</b> element is a container element for what appears in the list of choices. The height of the element is defined in the choiceheight attribute of the responses element. The text inside this element can be HTML text and can be images. This is a simple way to make a list of image choices.<br>


<h2>Example</h2>
<pre><code>&lt;statement &gt;&lt;![CDATA[“&lt;img src=”media/angry_icon.jpg” &gt;"]]&gt;&lt;/statement&gt;<br>
</code></pre>
<h1><code>&lt;scores&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;responses x="0" y="290" width="600" height="140" choiceheight="20"&gt;<br>
  &lt;choice branch="1"&gt;&lt;statement&gt;Look here, don’t talk to me like that &lt;/statement&gt;<br>
    &lt;scores&gt;<br>
    &lt;factor name="Customers Services" score="-5"&gt;&lt;/factor&gt;<br>
    &lt;factor name="Sales" score="-5"&gt;&lt;/factor&gt;<br>
    &lt;/scores&gt;<br>
  &lt;/choice&gt;<br>
&lt;/responses&gt;<br>
</code></pre>
<h2>Description</h2>
Each choice needs to have a <b><code>&lt;scores&gt;</code></b> element that holds the scores for each of the factor elements.<br>


<h2>Children</h2>
<a href='#<factor>.md'>&lt;factor&gt;</a>
<h1><code>&lt;factor&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;responses x="0" y="290" width="600" height="140" choiceheight="20"&gt;<br>
 &lt;choice branch="1"&gt;&lt;statement&gt;Look here, don’t talk to me like that &lt;/statement&gt;<br>
    &lt;scores&gt;<br>
    &lt;factor name="Customers Services" score="-5"&gt;&lt;/factor&gt;<br>
    &lt;factor name="Sales" score="-5"&gt;&lt;/factor&gt;<br>
    &lt;/scores&gt;<br>
  &lt;/choice&gt;<br>
&lt;/responses&gt;<br>
</code></pre>
<h2>Description</h2>
For each choice, you need to define what the score is for each of the factors. These are the factors that where defined at the start of the document in the factors element.<br>
<h2>Attributes</h2>
<ul>
<li> <b>name:</b> This is the exact name of the factors.</li>
<li> <b>score:</b> Each of the factors needs to have a score; this can be a positive or negative number.</li>
</ul>

<h1><code>&lt;helper&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;helper&gt;<br>
<br>
  &lt;help id="0" type="text" x="100" y="100" width="300" height="20" background="0x000000" alpha =".8" color="0xFFFFFF"&gt;You shouldn't be giving advice like that out without checking without first. &lt;/help&gt;<br>
  &lt;help id="1" x="200" y="200" width="100" height="110" background="0x000000" alpha =".8" color="0xFFFFFF"&gt; That is not a suitable response&lt;/help&gt;<br>
<br>
&lt;/helper&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>helper</b> element is a container element that appears at the end of the document. It contains a series of help elements that can be shown during the interaction.<br>


<h2>Children</h2>
<a href='#<help>.md'>&lt;help&gt;</a>
<h1><code>&lt;help&gt;</code></h1>
<h2>Syntax</h2>
<pre><code>&lt;helper&gt;<br>
  &lt;help id="0" type="text" x="100" y="100" width="300" height="20" background="0x000000" alpha =".8" color="0xFFFFFF"&gt;You shouldn't be  giving advice like that out without checking without first. &lt;/help&gt;<br>
  &lt;help id="1" type="text" x="200" y="200" width="100" height="110" background="0x000000" alpha =".8" color="0xFFFFFF"&gt; That is not a suitable response&lt;/help&gt;<br>
&lt;/helper&gt;<br>
</code></pre>
<h2>Description</h2>
The <b>help</b> element contains feedback that can be given during the interaction. The attributes on the element control the appearance of the feedback.<br>


<h2>Attributes</h2>
<ul>
<li> <b>id:</b> Is a number that reflects the help position in the helper element. This is the number that is used in the statement element.</li>
<li> <b>type:</b> Currently the only type that has been implemented is the text type.</li>
<li> <b>x:</b> Sets the x position of the help.</li>
<li> <b>y:</b> Sets the y position of the help.</li>
<li> <b>width:</b> Sets the width of the help.</li>
<li> height: Sets the height of all the help.</li>
<li> background: Sets the background colour of the help element; this is an RBG colour in written in HEX.</li>
<li> <b>alpha:</b> Sets the transparency of the element. Because the help element is often put on top of the other elements, this can useful.</li>
<li> <b>colour:</b> Sets the colour of the text; this is an RBG colour in written in HEX.</li>
</ul>