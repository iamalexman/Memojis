##!/bin/sh

xcrun xcodebuild docbuild \
	-scheme Memojis \
	-destination 'generic/platform=iOS Simulator' \
	-derivedDataPath "$PWD/.derivedData"
	
xcrun docc process-archive transform-for-static-hosting \
	"$PWD/.derivedData/Build/Products/Debug-iphonesimulator/Memojis.doccarchive" \
	--output-path ".docs" \
	--hosting-base-path "Memojis"

echo '<script>window.location.href += "/documentation/memojis"</script>' > .docs/index.html
