##############################
#      Youtube Streamer      #
#             By             #
#          OCHEANIC          #
#      www.ocheanic.tech     #
##############################

if [[ $EUID -ne 0 ]]; then
  echo "* Please run this script with Root privileges (sudo su)" 1>&2
  exit 1
printf "Installing Dependencies\n"
apt-get update
apt-get install ffmpeg
printf "Suscessfully installed the dependencies\n"
wget https://raw.githubusercontent.com/OCHEANIC/YoutubeStream/main/stream.sh
printf "You may change the video Url , Music url , Stream key in stream.sh\n"
exit 1
