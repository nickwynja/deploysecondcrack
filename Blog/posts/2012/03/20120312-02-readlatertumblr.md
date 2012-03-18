Add Instapaper Read It Later Button to Tumblr
========================================
Published: 2012-03-12 07:10:11pm

I really love [Instapaper](http://instapaper.com) so when I was working on alterations to the theme for my new blog [Hack/Make](http://hackmake.org) I wanted to add include Instapaper's Read Later button. I went over to the [documentation](http://www.instapaper.com/publishers) to see what kind of undertaking it would be. The "one-click button" that I was interested in is a simple `iframe` with a few variables specific to your post. Luckily, the URL and title for you tumblr post are easily accessible in the `{Permalink}` and `{Title} ` variables. All you need to do to add Instapaper's Read Later one-click button to your tumblr page is to add follow code into your theme wherever you want the button located:

    <iframe border="0" scrolling="no" width="78" height="17" allowtransparency="true" frameborder="0" style="margin-bottom: -3px; z-index: 1338; border: 0px; background-color: transparent; overflow: hidden;" src="http://www.instapaper.com/e2?url={Permalink}&title={Title}"></iframe>

 If you need to add some padding, simply put the `iframe` into a `<div>` and apply the appropriate styling. Now your readers can easily take your article on the go with them on the wonderful Instapaper apps for iPhone and iPad.