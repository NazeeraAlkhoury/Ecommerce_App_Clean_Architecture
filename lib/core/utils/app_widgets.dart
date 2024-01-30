import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/global/routes/app_routes.dart';
import 'package:ecommerce_app/core/global/theme/app_colors/app_colors_light.dart';
import 'package:ecommerce_app/core/global/theme/app_fonts.dart';
import 'package:ecommerce_app/core/global/theme/app_text_styles.dart';
import 'package:ecommerce_app/core/utils/app_enums.dart';
import 'package:ecommerce_app/core/utils/app_sizes.dart';
import 'package:ecommerce_app/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required String labelText,
  required IconData prefixIcon,
  IconData? suffixIcon,
  Function? onsuffix,
  Function? onChanged,
  Function? onTap,
  Function? onSubmitted,
  required TextInputType textInputType,
  required Function validate,
  bool? isObscureText = false,
}) =>
    TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: () {
                  onsuffix!();
                },
                icon: Icon(suffixIcon))
            : null,
      ),
      onChanged: (value) {
        onChanged!(value);
      },
      onTap: () {
        onTap!();
      },
      onFieldSubmitted: ((value) {
        onSubmitted!(value);
      }),
      keyboardType: textInputType,
      validator: (String? value) {
        return validate(value!);
      },
      obscureText: isObscureText!,
    );

Color toastColor(ToastState toastState) {
  switch (toastState) {
    case ToastState.success:
      return AppColorsLight.grey;

    case ToastState.error:
      return AppColorsLight.primaryColor;
  }
}

void showToast({required String message, required ToastState toastState}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: toastColor(toastState),
      textColor: Colors.white,
      fontSize: 16.0,
    );

Widget productItem({
  required Product product,
  required BuildContext context,
}) =>
    InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        Routes.productDetailsRoute,
      ),
      child: Card(
        color: Colors.grey[200],

        // decoration: BoxDecoration(
        //     color: Colors.grey[200],
        //     borderRadius: BorderRadius.circular(AppSize.s20)),
        // padding: const EdgeInsets.all(AppPadding.p10),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  CachedNetworkImage(
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 150.0,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    imageUrl: product.image,
                    fit: BoxFit.fill,
                    height: 150,
                    width: double.infinity,
                  ),
                  if (product.discount != 0)
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      color: AppColorsLight.primaryColor,
                      child: Text(
                        'DISCOUNT',
                        style: getMediumStyle(
                          color: AppColorsLight.white,
                          fontsize: AppFontSize.s10,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(
                height: AppSize.s14,
              ),
              SizedBox(
                height: 37,
                child: Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: getMediumStyle(
                      color: AppColorsLight.black, fontsize: AppFontSize.s14),
                ),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Row(
                children: [
                  Text(
                    '\$${product.price}',
                    style: getRegularStyle(
                      color: AppColorsLight.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: AppSize.s5,
                  ),
                  Text(
                    product.oldPrice.toString(),
                    style: getRegularStyle(
                      color: AppColorsLight.grey,
                    ).copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.favorite),
                ],
              ),
            ],
          ),
        ),
      ),
    );
