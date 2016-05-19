<?php
//Relativity MVP - run a query and display the results.
//	Let's start with exec(whois $domain);
// NOTE: This is insanely insecure.  Do not expose it to anyone.
// Relativity (for now at least) is intended to be run locally only bound to 127.0.0.1
// You've been warned.
// No really... there are so many bad things that could happen.  You don't even know...
// or if you do, you'll make sure nobody else but you can connec to this thing until we get some security baked in.
// Prototype stage with little hints in place to help along adding features.
// Will refactor after MVP in a rev or two.
include "./header";
require_once "./inc/db";
require_once "./inc/QueryCommands";
require_once "./inc/util";

if(isset($_GET['command'])){ # anything to do?
	$command = $_GET['command'];
	
	if(isset($_GET['domain'])){ # do it to what? (going to overuse domain for a bit)
		$domain = $_GET['domain'];
	}

	$response = array();

	switch ($command) { # let's decide what to do in one place and go from there...
		case 'dig':
			$response = dig($domain);
			break;
		case 'traceroute':
			$response = traceroute($domain);
			break;
		case 'whois':
			$response = whois($domain);
			break;
		case 'curl':
			$response = rcurl($domain); # Note that we're using /usr/bin/curl instead of PHP'ed libcurl
			break;
	}
	echo_response($response); # How'd it go? also possible that output happened and this doesn't do anything...
}
?>

<H1>Relativity</H1>

<form action="index.php" method="get">
dig:<input type="text" name="domain" value="<?php if(isset($domain)){ echo $domain; }?>"><br />
<input type="hidden" name="command" value="dig" />
<input type="submit" />
</form>

<form action="index.php" method="get">
traceroute:<input type="text" name="domain" value="<?php if(isset($domain)){ echo $domain; }?>"><br />
<input type="hidden" name="command" value="traceroute" />
<input type="submit" />
</form>

<form action="index.php" method="get">
whois:<input type="text" name="domain" value="<?php if(isset($domain)){ echo $domain; }?>"><br />
<input type="hidden" name="command" value="whois" />
<input type="submit" />
</form>

<form action="index.php" method="get">
curl:<input type="text" name="domain" value="<?php if(isset($domain)){ echo $domain; }?>"><br />
<input type="hidden" name="command" value="curl" />
<input type="submit" />
</form>


<?php
include "./footer";
