MIXUSER="image28"


curl -s https://mixer.com/api/v1/channels/$MIXUSER |\
sed -E s/"(,|\{|\})"/"\n"/g |\
sed -e s/"\""//g |\
grep -E "(username|level|sparks|online|viewersCurrent):" |\
grep -v channel > .mixer.userinfo

USERNAME=`cat .mixer.userinfo | grep "username:"`
LEVEL=`cat .mixer.userinfo | grep "level:"`
SPARKS=`cat .mixer.userinfo | grep "sparks:"`
LIVE_VIEWERS=`cat .mixer.userinfo | grep "viewersCurrent:" | head -n1`
ONLINE=`cat .mixer.userinfo | grep "online:"`

echo "$USERNAME"
echo "$LEVEL"
echo "$SPARKS"
echo "$LIVE_VIEWERS"
if test $ONLINE -eq 1;
then
	echo "ONLINE"
else
	echo "OFFLINE"
fi


