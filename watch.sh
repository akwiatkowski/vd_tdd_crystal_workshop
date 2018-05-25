inotifywait -e close_write,moved_to,create -mr src/ spec/ |
while read path action file; do
  crystal spec
done
