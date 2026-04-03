import 'package:cached_network_image/cached_network_image.dart';
import 'package:wespend/ui/utils/theme/theme.dart';
import 'package:wespend/ui/utils/widgets/common_svg.dart';

/// If Url Contains Svg image

class CacheImage extends StatelessWidget {
  final String imageURL;
  final double? height;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;
  final double? width;
  final bool? setPlaceHolder;
  final String? placeholderImage;
  final BoxFit? contentMode;
  final BoxShape? shape;
  final String? placeholderName;

  const CacheImage(
      {super.key,
      required this.imageURL,
      this.height,
      this.width,
      this.setPlaceHolder = true,
      this.placeholderImage,
      this.contentMode,
      this.bottomLeftRadius,
      this.bottomRightRadius,
      this.topLeftRadius,
      this.topRightRadius,
      this.shape,
      this.placeholderName});

  @override
  Widget build(BuildContext context) {
    return (imageURL == '')
        ? placeHolderWidget()
        : CachedNetworkImage(
            imageUrl: imageURL,
            imageBuilder: (context, imageProvider) => Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(topLeftRadius ?? 0.0),
                    topRight: Radius.circular(topRightRadius ?? 0.0),
                    bottomRight: Radius.circular(bottomRightRadius ?? 0.0),
                    bottomLeft: Radius.circular(bottomLeftRadius ?? 0.0)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: contentMode ?? BoxFit.fill,
                  // colorFilter:ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                ),
              ),
            ),
            placeholder: (context, url) {
              return placeHolderWidget();
            },
            errorWidget: (context, url, error) => placeHolderWidget(),
          );
  }

  /// Place Holder Widget
  /*Widget placeHolderWidget() {
    return CommonSVG(
      height: height,
      width: width,
      strIcon: placeholderImage??Assets.svgs.svgImagePlaceholder.keyName,
    );
  }*/

  Widget placeHolderWidget() {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftRadius ?? 0.0),
            topRight: Radius.circular(topRightRadius ?? 0.0),
            bottomRight: Radius.circular(bottomRightRadius ?? 0.0),
            bottomLeft: Radius.circular(bottomLeftRadius ?? 0.0)),
      ),
      child:


      Center(
        child: (placeholderName != '' && placeholderName != null)?
        ClipOval(

          child: Container(
            alignment: Alignment.center,
            color: Colors.black,
            height: height,
            width: width,
            child: Text(
              getInitials(placeholderName ?? ''),
              style: TextStyles.semiBold.copyWith(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ) : CommonSVG(
          height: height,
          width: width,
          strIcon: placeholderImage??'',
        )
        /*placeholderImage == ''
            ? Text(
          placeholderName?[0] ?? '',
          style: TextStyles.semiBold.copyWith(fontSize: 25),
        )
            : SizedBox(
          height: height,
          width: width,
          child: CommonSVG(
            strIcon: placeholderImage ?? Assets.svgs.svgPlaceholder.keyName,
            boxFit: BoxFit.fill,
          ),
        )*/,
      ),
    );
  }
  String getInitials(String name) {
    if (name.trim().isEmpty) return '';
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return (parts[0][0] + parts[1][0]).toUpperCase();
    } else {
      return name[0].toUpperCase();
    }
  }
}
