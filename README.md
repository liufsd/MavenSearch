# MavenSearchResCommandLineTools 

####just like cocoapods serach . support maven search res with command line

###1.install this library by gem and search fresco
 
```
gem install MavenSearch

liu:~ liupeng$ MavenSearch fresco
fresco
************************************************
 ......searching < fresco > .......
************************************************

************
result:::::::::
--------------------------------------
"com.facebook.fresco:fresco:0.3.0"
"com.facebook.fresco:imagepipeline:0.3.0"
"com.facebook.fresco:fbcore:0.3.0"
"com.facebook.fresco:drawee:0.3.0"
"com.facebook.fresco:imagepipeline-okhttp:0.3.0"
"com.facebook.fresco:drawee-volley:0.3.0"
--------------------------------------
----GradleConfig
************* copy this to your project gradle config  file *************

dependencies
			 {
			 	compile com.facebook.fresco:fresco:0.3.0:0.3.0'}

************* ------- searching gradle end -------------- *************

----MavenConfig
************* copy this to your project maven config file *************

<dependency>
			<groupId>com.facebook.fresco</groupId> 
			<artifactId>fresco</artifactId>
			<version>0.3.0</version>
			<type>aar</type>
		 </dependency>

************* ------- searching maven end -------------- *************
```


## Creators


**Liu Peng**

- <https://twitter.com/79144876>
- <https://github.com/79144876>

##Link

- <https://github.com/79144876/GradleSearchResCommandLineTools>

