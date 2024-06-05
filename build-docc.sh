##!/bin/sh

# Build a Documentation
xcrun xcodebuild docbuild \
	-scheme Memojis \
	-destination 'generic/platform=iOS Simulator' \
	-derivedDataPath "$PWD/.derivedData"
	
# Transform a Documentation from doccarchive to hosting
xcrun docc process-archive transform-for-static-hosting \
	"$PWD/.derivedData/Build/Products/Debug-iphonesimulator/Memojis.doccarchive" \
	--output-path ".docs" \
	--hosting-base-path "Memojis"

# Rule on the server to rewrite incoming URLs that begin with /documentation
echo '<script>window.location.href += "/documentation/memojis"</script>' > .docs/index.html
