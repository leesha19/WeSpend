import 'dart:js_interop';
import 'dart:typed_data';
import 'package:web/web.dart' as web;

class WebHelper {
  static void setFavicon(String href) {
    final head = web.document.head;
    if (head == null) return;

    final nodeList = head.querySelectorAll("link[rel~='icon']");
    final favicons = nodeListToList(nodeList);

    favicons.forEach((icon) => icon.remove());

    // Create new link element for favicon
    final link = web.HTMLLinkElement()
      ..rel = 'icon'
      ..href = href;

    head.append(link);
  }

  static void setLoadingFavicon() => setFavicon('icons/loading.png');

  static void setDefaultFavicon() => setFavicon('web/favicon.webp');
}

List<web.Element> nodeListToList(web.NodeList nodeList) {
  final List<web.Element> list = [];
  for (var i = 0; i < nodeList.length; i++) {
    // nodeList.item(i) returns Node?, cast to Element if sure
    final node = nodeList.item(i);
    if (node is web.Element) {
      list.add(node);
    }
  }
  return list;
}

void downloadFileFromWeb({required Uint8List bytes, required String filename, required String fileType}) {
  // Create a Blob from bytes with MIME type for give fileType
  final blobParts = <JSAny>[bytes.toJS].toJS;
  final blob = web.Blob(blobParts);

  // Create an object URL for the Blob
  final url = web.URL.createObjectURL(blob);

  // Create an invisible anchor element
  final anchor = web.document.createElement('a') as web.HTMLAnchorElement
    ..href = url
    ..download = filename
    ..style.display = 'none';

  // Add anchor to the document
  web.document.body?.append(anchor);

  // Trigger click to start download
  anchor.click();

  // Cleanup - remove anchor and revoke object URL
  anchor.remove();
  web.URL.revokeObjectURL(url);
}
