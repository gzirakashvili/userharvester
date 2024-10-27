#!/bin/bash
#2020/26/მარტი

scanner() {

read -p $'\e[1;92m[\e[0m\e[1;77m?\e[0m\e[1;92m] შეიყვანეთ მომხმარებელის სახელი:\e[0m ' username

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] მოწმდება მომხმარებელი\e[0m\e[1;77m %s\e[0m\e[1;92m \e[0m\n" $username

## INSTAGRAM
check_insta=$(curl -s -H "Accept-Language: en" "https://www.instagram.com/$username" -L | grep -o 'The link you followed may be broken'; echo $?)
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Instagram: \e[0m"

if [[ $check_insta == *'1'* ]]; then
printf "https://www.instagram.com/%s\n" $username
elif [[ $check_insta == *'0'* ]]; then
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
fi

## Facebook
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Facebook: \e[0m"
check_face=$(curl -s "https://www.facebook.com/$username" -L -H "Accept-Language: en" | grep -o 'not found'; echo $?)


if [[ $check_face == *'1'* ]]; then
printf "https://www.facebook.com/%s\n" $username
elif [[ $check_face == *'0'* ]]; then
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
fi

## TWITTER 
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Twitter: \e[0m"
check_twitter=$(curl -s "https://www.twitter.com/$username" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)


if [[ $check_twitter == *'1'* ]]; then
printf "https://www.twitter.com/%s\n" $username
elif [[ $check_twitter == *'0'* ]]; then
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
fi

## YOUTUBE
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] YouTube: \e[0m"
check_youtube=$(curl -s "https://www.youtube.com/$username" -L -H "Accept-Language: en" | grep -o 'Not Found'; echo $?)


if [[ $check_youtube == *'1'* ]]; then
printf "https://www.youtube.com/%s\n" $username
elif [[ $check_youtube == *'0'* ]]; then
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
fi

## BLOGGER
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Blogger: \e[0m"
check=$(curl -s "https://$username.blogspot.com" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404'; echo $?)


if [[ $check == *'1'* ]]; then
printf "https://%s.blogspot.com\n" $username
elif [[ $check == *'0'* ]]; then
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
fi

## REDDIT
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Reddit: \e[0m"
check1=$(curl -s -i "https://www.reddit.com/user/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | head -n1 | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.reddit.com/user/%s\n" $username
fi

## WORDPRESS
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wordpress: \e[0m"
check1=$(curl -s -i "https://$username.wordpress.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Do you want to register' ; echo $?)
if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://%s.wordpress.com\n" $username
fi

## PINTEREST
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Pinterest: \e[0m"
check1=$(curl -s -i "https://www.pinterest.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '?show_error' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.pinterest.com/%s\n" $username
fi

## GITHUB
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Github: \e[0m"
check1=$(curl -s -i "https://www.github.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.github.com/%s\n" $username
fi

## TUMBLR
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Tumblr: \e[0m"
check1=$(curl -s -i "https://$username.tumblr.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://%s.tumblr.com\n" $username
fi

## FLICKR
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Flickr: \e[0m"
check1=$(curl -s -i "https://www.flickr.com/people/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.flickr.com/photos/%s\n" $username
fi

## STEAM
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Steam: \e[0m"
check1=$(curl -s -i "https://steamcommunity.com/id/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'The specified profile could not be found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://steamcommunity.com/id/%s\n" $username
fi

## VIMEO
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Vimeo: \e[0m"
check1=$(curl -s -i "https://vimeo.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://vimeo.com/%s\n" $username
fi


## SoundCloud
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] SoundCloud: \e[0m"
check1=$(curl -s -i "https://soundcloud.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://soundcloud.com/%s\n" $username
fi

## DISQUS
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Disqus: \e[0m"
check1=$(curl -s -i "https://disqus.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 NOT FOUND' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://disqus.com/%s\n" $username
fi

## MEDIUM
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Medium: \e[0m"
check1=$(curl -s -i "https://medium.com/@$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://medium.com/@%s\n" $username
fi

## DEVIANTART
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] DeviantART: \e[0m"
check1=$(curl -s -i "https://$username.deviantart.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://%s.deviantart.com\n" $username
fi

## VK
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] VK: \e[0m"
check1=$(curl -s -i "https://vk.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://vk.com/%s\n" $username
fi

## About.me
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] About.me: \e[0m"
check1=$(curl -s -i "https://about.me/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://about.me/%s\n" $username
fi


## Imgur
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Imgur: \e[0m"
check1=$(curl -s -i "https://imgur.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://imgur.com/user/%s\n" $username
fi

## FlipBoard
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Flipboard: \e[0m"
check1=$(curl -s -i "https://flipboard.com/@$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://flipboard.com/@%s\n" $username
fi

## SlideShare
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] SlideShare: \e[0m"
check1=$(curl -s -i "https://slideshare.net/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://slideshare.net/%s\n" $username
fi

## Fotolog
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Fotolog: \e[0m"
check1=$(curl -s -i "https://fotolog.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://fotolog.com/%s\n" $username
fi


## Spotify
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Spotify: \e[0m"
check1=$(curl -s -i "https://open.spotify.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://open.spotify.com/user/%s\n" $username
fi

## MixCloud
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] MixCloud: \e[0m"
check1=$(curl -s -i "https://www.mixcloud.com/$username" -H "Accept-Language: en" -L | grep -o 'error-message' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.mixcloud.com/%s\n" $username
fi

## Scribd
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Scribd: \e[0m"
check1=$(curl -s -i "https://www.scribd.com/$username" -H "Accept-Language: en" -L | grep -o 'show_404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.scribd.com/%s\n" $username
fi

## Badoo
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Badoo: \e[0m"
check1=$(curl -s -i "https://www.badoo.com/en/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.badoo.com/en/%s\n" $username
fi

# Patreon
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Patreon: \e[0m"
check1=$(curl -s -i "https://www.patreon.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.patreon.com/%s\n" $username
fi

## BitBucket
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] BitBucket: \e[0m"
check1=$(curl -s -i "https://bitbucket.org/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://bitbucket.org/%s\n" $username
fi

## DailyMotion
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] DailyMotion: \e[0m"
check1=$(curl -s -i "https://www.dailymotion.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.dailymotion.com/%s\n" $username
fi

## Etsy
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Etsy: \e[0m"
check1=$(curl -s -i "https://www.etsy.com/shop/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.etsy.com/shop/%s\n" $username
fi

## CashMe
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] CashMe: \e[0m"
check1=$(curl -s -i "https://cash.me/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://cash.me/%s\n" $username
fi

## Behance
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Behance: \e[0m"
check1=$(curl -s -i "https://www.behance.net/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.behance.net/%s\n" $username
fi

## GoodReads
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] GoodReads: \e[0m"
check1=$(curl -s -i "https://www.goodreads.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.goodreads.com/%s\n" $username
fi

## Instructables
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Instructables: \e[0m"
check1=$(curl -s -i "https://www.instructables.com/member/$username" -H "Accept-Language: en" -L | grep -o '404 NOT FOUND' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.instructables.com/member/%s\n" $username
fi

## KeyBase
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Keybase: \e[0m"
check1=$(curl -s -i "https://keybase.io/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://keybase.io/%s\n" $username
fi

## Kongregate
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Kongregate: \e[0m"
check1=$(curl -s -i "https://kongregate.com/accounts/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://kongregate.com/accounts/%s\n" $username
fi

## Livejournal
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] LiveJournal: \e[0m"
check1=$(curl -s -i "https://$username.livejournal.com" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://%s.livejournal.com\n" $username
fi

## AngelList
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] AngelList: \e[0m"
check1=$(curl -s -i "https://angel.co/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://angel.co/%s\n" $username
fi

## Last.fm
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] last.fm: \e[0m"
check1=$(curl -s -i "https://last.fm/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://last.fm/user/%s\n" $username
fi

## Dribbble
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Dribbble: \e[0m"
check1=$(curl -s -i "https://dribbble.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://dribbble.com/%s\n" $username
fi

## Codecademy
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Codecademy: \e[0m"
check1=$(curl -s -i "https://www.codecademy.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.codecademy.com/%s\n" $username
fi

## Gravatar
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Gravatar: \e[0m"
check1=$(curl -s -i "https://en.gravatar.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://en.gravatar.com/%s\n" $username
fi

## Pastebin
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Pastebin: \e[0m"
check1=$(curl -s -i "https://pastebin.com/u/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'location: /index' ; echo $?)
if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://pastebin.com/u/%s\n" $username
fi

## Foursquare
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Foursquare: \e[0m"
check1=$(curl -s -i "https://foursquare.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://foursquare.com/%s\n" $username
fi

## Roblox
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Roblox: \e[0m"
check1=$(curl -s -i "https://www.roblox.com/user.aspx?username=$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://foursquare.com/%s\n" $username
fi

## Gumroad
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Gumroad: \e[0m"
check1=$(curl -s -i "https://www.gumroad.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.gumroad.com/%s\n" $username
fi

## Newgrounds
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Newgrounds: \e[0m"
check1=$(curl -s -i "https://$username.newgrounds.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://%s.newgrounds.com\n" $username
fi

## Wattpad
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wattpad: \e[0m"
check1=$(curl -s -i "https://www.wattpad.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.wattpad.com/user/%s\n" $username
fi

## Canva
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Canva: \e[0m"
check1=$(curl -s -i "https://www.canva.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.canva.com/%s\n" $username
fi

## CreativeMarket
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] CreativeMarket: \e[0m"
check1=$(curl -s -i "https://creativemarket.com/$username" -H "Accept-Language: en" -L | grep -o '404eef72' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://creativemarket.com/%s\n" $username
fi

## Trakt
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Trakt: \e[0m"
check1=$(curl -s -i "https://www.trakt.tv/users/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.trakt.tv/users/%s\n" $username
fi

## 500px
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] 500px: \e[0m"
check1=$(curl -s -i "https://500px.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://500px.com/%s\n" $username
fi

## Buzzfeed
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Buzzfeed: \e[0m"
check1=$(curl -s -i "https://buzzfeed.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://buzzfeed.com/%s\n" $username
fi

## TripAdvisor
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] TripAdvisor: \e[0m"
check1=$(curl -s -i "https://tripadvisor.com/members/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://tripadvisor.com/members/%s\n" $username
fi

## HubPages
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] HubPages: \e[0m"
check1=$(curl -s -i "https://$username.hubpages.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://%s.hubpages.com/\n" $username
fi

## Contently
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Contently: \e[0m"
check1=$(curl -s -i "https://$username.contently.com" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://%s.contently.com\n" $username
fi

## Houzz
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Houzz: \e[0m"
check1=$(curl -s -i "https://houzz.com/user/$username" -H "Accept-Language: en" -L | grep -o 'an error has occurred' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://houzz.com/user/%s\n" $username
fi

## blip.fm
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] blip.fm: \e[0m"
check1=$(curl -s -i "https://blip.fm/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://blip.fm/%s\n" $username
fi

## Wikipedia
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wikipedia: \e[0m"
check1=$(curl -s -i "https://www.wikipedia.org/wiki/User:$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.wikipedia.org/wiki/User:%s\n" $username
fi

## HackerNews
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] HackerNews: \e[0m"
check1=$(curl -s -i "https://news.ycombinator.com/user?id=$username" -H "Accept-Language: en" -L | grep -o 'No such user' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://news.ycombinator.com/user?id=%s\n" $username
fi

## CodeMentor
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] CodeMentor: \e[0m"
check1=$(curl -s -i "https://www.codementor.io/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.codementor.io/%s\n" $username
fi

## ReverbNation
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] ReverbNation: \e[0m"
check1=$(curl -s -i "https://www.reverbnation.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.reverbnation.com/%s\n" $username
fi

## Designspiration 65
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Designspiration: \e[0m"
check1=$(curl -s -i "https://www.designspiration.net/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.designspiration.net/%s\n" $username
fi

## Bandcamp
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Bandcamp: \e[0m"
check1=$(curl -s -i "https://www.bandcamp.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.bandcamp.com/%s\n" $username
fi


## ColourLovers
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] ColourLovers: \e[0m"
check1=$(curl -s -i "https://www.colourlovers.com/love/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.colourlovers.com/love/%s\n" $username
fi


## IFTTT
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] IFTTT: \e[0m"
check1=$(curl -s -i "https://www.ifttt.com/p/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.ifttt.com/p/%s\n" $username
fi

## Ebay
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Ebay: \e[0m"
check1=$(curl -s -i "https://www.ebay.com/usr/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found\|eBay Profile - error' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.ebay.com/usr/%s\n" $username
fi

## Slack
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Slack: \e[0m"
check1=$(curl -s -i "https://$username.slack.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://%s.slack.com\n" $username
fi

## OkCupid
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] OkCupid: \e[0m"
check1=$(curl -s -i "https://www.okcupid.com/profile/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.okcupid.com/profile/%s\n" $username
fi

## Trip
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Trip: \e[0m"
check1=$(curl -s -i "https://www.trip.skyscanner.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found\|HTTP/2 410' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.trip.skyscanner.com/user/%s\n" $username
fi

## Ello
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Ello: \e[0m"
check1=$(curl -s -i "https://ello.co/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://ello.co/%s\n" $username
fi

## Tracky
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Tracky: \e[0m"
check1=$(curl -s -i "https://tracky.com/user/$username" -H "Accept-Language: en" -L | grep -o 'profile:username' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'0'* ]]; then 
printf "https://tracky.com/~%s\n" $username
fi

## Tripit
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Tripit: \e[0m"
check1=$(curl -s -i "https://www.tripit.com/people/$username#/profile/basic-info" -H "Accept-Language: en" -L | grep -o 'location:https://www.tripit.com/home' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://www.tripit.com/people/%s#/profile/basic-info\n" $username
fi

## Basecamp
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Basecamp: \e[0m"
check1=$(curl -s -i "https://$username.basecamphq.com/login" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mვერ მოიძებნა\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 
printf "https://%s.basecamphq.com/login\n" $username
fi
}
printf "\e[1;77m  _   _               _   _                           _       ____\e[0m\n"
printf "\e[1;77m | | | |___  ___ _ __| | | | __ _ _ ____   _____  ___| |_ ___|  _ \ \e[0m\n"
printf "\e[1;77m | | | / __|/ _ \ '__| |_| |/ _  |  __\ \ / / _ \/ __| __/ _ \ |_) | \e[0m\n"
printf "\e[1;77m | |_| \__ \  __/ |  |  _  | (_| | |   \ V /  __/\__ \ ||  __/  _ < \e[0m\n"
printf "\e[1;77m  \___/|___/\___|_|  |_| |_|\__,_|_|    \_/ \___||___/\__\___|_| \_\ \e[0m\n"
printf "\n"
scanner

