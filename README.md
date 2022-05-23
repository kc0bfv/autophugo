# AutoPhugo

AutoPhugo [ˌɔtoʊˈfjuːgəʊ] is a gallery/photoblog theme for Hugo that's a little more automatic than [Phugo](https://github.com/kc0bfv/phugo/).  It is a port of HTML5 UP [Multiverse template](https://html5up.net/multiverse).  Phugo was originally created by Aerohub, Pavel Kanyshev.

Preview at <https://kc0bfv.github.io/autophugo>

## Features

- Fully Responsive
- HTML5 + CSS3
- FontAwesome Icons
- Multi-level Albums Support
- Google Analytics
- Basic Breadcrumbs
- Contact Form
- Automated Image Scaling

## Recent Change

**PLEASE NOTE**

On 10 Jul 2021 clicking an image now updates the location bar hash (fragment id).  That way, the URL represents the open image too...  This required some javascript changes.  If these cause a problem for you, please let me know so I can make changes to this functionality.

On 23 Jan 2020 subalbum and noalbum support no longer requires specifying a `type` in the metadata.  Furthermore, images and subalbums can be mixed within albums - including on the homepage (although mixing can be confusing for users).  Simply build an `assets` directory structure by placing images and directories wherever you want, then mirror the directory structure in `content`.

On 19 Dec 2020 `albumthumb` file paths work differently.  You must specify the path relative to the assets directory.  So - where before the `fish/_index.md` example content specified `fish_02.jpg` as the `albumthumb`, now it specifies `fish/fish_02.jpg`.  I apologize for the breaking change, but it really should've worked this way from the start.  It brings things in-line with the resources src, and the subalbum path specifications.

## Installation

Follow [Hugo's standard instructions](https://gohugo.io/getting-started/quick-start/#step-3-add-a-theme) for adding a theme to your site.

## Configuration

The `exampleSite` demonstrates the features unique to this theme.  In your site config params section the following extra parameters are supported:

* `favicon` - the favicon URL, relative to your site (placed in header meta tag)
* `description` - the description for the header meta tag.  This will be interpreted as markdown, and some markdown will require the string to be enclosed in quotes.
* `msvalidate` - MS validation tag
* `googlesiteverification` - Google site verification tag
* `thumb_width` - thumbnail width after resizing (default 480 pixels)
* `thumb_quality` - thumbnail encoding quality percentage after resizing (default 50%)
* `full_width` - display-sized image width after resizing (default 960 pixels)
* `full_quality` - display-sized image encoding quality after resizing (default 90%)
* `column_count` - the number of columns in which to display images (default 2)
* `breadcrumb_use_title` - if true, breadcrumbs (the path-like display at the bottom) will use page titles instead of paths
* `filename_as_phototitle` - if true, a humanized form of the filename will be used as the phototitle (default false)
* `images_downloadable` - if true, images have a download button (default true)
* `images_downloadable_use_orig` - if true, the download button will download the original image instead of the full size image - this will likely greatly increase the size of your site (default false)
* `taxonomies_links` - if true, links to the taxonomy pages will be present in the footer and on the tagged items (default false)

Additionally, `Author.name` and `Author.email` in the site config will display as the author and webmaster email.

Header and footer customization is possible with the following site parameters.  These are a little more complex to implement in TOML - check out the `exampleSite` configuration for a demonstration and comments:

* `header.links` - a list of maps with keys `name`, `url`, and `icon`, describing links that will be visible in the navigation bar
* `footer.paragraph` - a map with keys `headline` and `text` specifying the content to display in the `footer` popout (labeled "About" on the example site)
* `footer.social` - a map with keys `headline` (text) and `links` (list of maps). `links` entries can have `label`, `url`, and `icon` for each.  These are intended to be social media links with a "Follow Me"-ish headline.
* `footer.contact` - a map with keys `hide`, `realEmail`, `headline`, `buttonText`, and `resetText`, `name`, `email`, and `message`,specifying the properties of the contact form (or hiding it).  See the `exampleSite` config for details about how to set this up.
* `footer.copyright` - copyright info for your site

The `exampleSiteNoAlbum` directory demonstrates a no-album layout, where all photos show up on the front page.

## Album Construction

Inside your project create the directory `assets/NAME-OF-YOUR-ALBUM`.  Place all of one album's photos inside that directory.

Inside your project run:

```
$ hugo new NAME-OF-YOUR-ALBUM/_index.md
```

It will create an index file for your first album.  Open `content/NAME-OF-YOUR-ALBUM/_index.md` with your text editor. You'll see something like this:

```
---
title: "NAME-OF-YOUR-ALBUM"
date: "2020-03-15T00:00:00+00:00"
albumthumb: "NAME-OF-YOUR-ALBUM/photo00.jpg"
draft: false
resources:
- src: "NAME-OF-YOUR-ALBUM/photo00.jpg"
- src: "NAME-OF-YOUR-ALBUM/photo01.jpg"
- src: "NAME-OF-YOUR-ALBUM/photo02.jpg"
---
```

Change the title of your album if you wish, and set the filename of album's cover thumbnail.  The filename is relative to the assets folder, so if your album is named `dogs` and one of your images there is named `dog_01.jpg` you can put `dogs/dog_01.jpg` in `albumthumb` to select it.

In addition to those frontmatter options, you can also specify metadata for some or all of your images.  Do that by modifying the `resources` array with map elements.  The maps specify the image they apply to with the `src` key, as `src: "album/image.jpg"`.  You can then specify some or all of the following items: `alt`, `phototitle`, and `description`.  Demonstration of this is in the `exampleSite` directory albums.

### Sub-Albums

If you'd like to create an album that contains other albums - you can do that!  The following command creates an album called "dogs", for instance:

```
hugo new dogs/_index.md
```

The resulting `content/dogs/_index.md` file looks like:

```
---
title: "Dogs"
date: 2020-03-15T14:00:00-06:00
albumthumb: "dogs/subalbum/photo_00.jpg"
---
```

Make sure to specify an albumthumb!

Now you could create albums inside that "dogs" album just like before...

```
hugo new dogs/pensive-dogs/_index.md
```

Your `assets` directory layout should mirror the directory layout in `content`.

See the `exampleSite` and the `dogs` folder and subfolders specifically.  The `dogs` album actually contains images and subalbums mixed together as a demonstration.

### Image and Subalbum Mixing

You can place images and subalbums together - the `assets` directory would contain images and directories in that case.  You'd create content directories that mirror that layout.  The `dogs` album is an example of this.

**Watch out!**  This is likely to be confusing to users though.  There's no default delineation when these mixed albums are displayed.  Subalbums display towards the top, and images lower - but otherwise a user will have no clear idea what will happen when they click an image.  Will it display full-sized, or will it open a subalbum?

## Using Custom Weights

Default sorting for subalbums and images sorts by weight.  For subalbums with the same weight it sorts by date, and for images with the same weight it sorts by filename.  If you don't specify a weight for an item, the default is 0.  Therefore - if you don't set any weights you'll sort by date...  Lower weights come first so negative weights get sorted before unspecified weights and positive ones.

## Tagging and Categorizing (taxonomies)

You can tag and categorize your images and subalbums, and you can create other taxonomies and use those too!  There are a couple site configurations to understand...

`disableKinds = ["taxonomy", "term"]`

If you want tags or categories do *not* have this line in your site config.  If you specify these values for disableKinds in your site config you will disable all taxonomy pages.  Term pages are not generated as part of this theme - the terms all appear on their taxonomy page.  Regardless, if you want to have tags or categories, do *not* have the above line.

You can use the `[taxonomies]` site config section to create new taxonomies or remove the defaults.  More information is in the [Hugo documentation](https://gohugo.io/content-management/taxonomies/#default-taxonomies).

The `taxonomies_links` parameter defaults to false, disabling links to the taxonomies pages even if they get generated...  Set it to true in your site config and links will show up in the page footers and on tagged items.

## Building the Site

Run `hugo` to build your site.  Output will be placed in the `public` directory.  The original images will not be included - only the resized versions.

When building your site, hugo must build thumbnails and distribution-sized images.  This process can take some time, especially if you have many pictures...  It stores versions of the images in the `resources` directory, so it doesn't have to redo the process every build.

Therefore - after adding an album your next build may take minutes.  Future ones will be quicker.

## Development Notes

If you try multiple sizes or quality settings for your images, you'll start to amass large numbers of images in your `resources` directory.  Once you settle on a quality and size you like you should consider deleting the resources and rebuilding to eliminate the unused images.

Regardless of the number of resources you have, Hugo will only deploy the ones actually used in a build.  Unused image resources will not be deployed.

## Advanced Features

Image resizing: normally you specify `thumb_width` and `full_width` in your configuration, and the qualities, to modify how Autophugo scales your images.  Autophugo uses these values to build a string for Hugo's Resize function.  You can specify that string directly though...  Set `thumb_size` or `full_size` directly in your config to bypass the other ones.  The format of the string is [documented here](https://gohugo.io/content-management/image-processing/).  You can specify `full_size` and `thumb_size` for the entire site, or in the `_index.md` for a specific subalbum.

You can also change the method Hugo uses to resize your full-sized images (the option is not available for thumbnails).  Hugo has both `Resize` and `Fit` methods that are appropriate for resizing the full-sized images.  By default Autophugo uses `Resize`.  By setting `full_resize_method` to `Fit`, `Resize`, or `None`, you can change that.  You must also specify a `full_size` if you change to the `Fit` method.  That's because both the height and width must be specified, and with `Resize` you only need one or the other.  Again, the format of the `full_size` string is [documented here](https://gohugo.io/content-management/image-processing/).  Here are some examples:

* Scale an image down, keeping aspect ratio, to a max height of 960px and a max width of 960px, with a 90% quality: `full_resize_method = "fit"`, `full_size = "960x960 q90"`
* Scale an image to a width of 960px, allowing whatever height is required for the original aspect ratio, with a 90% quality: `full_resize_method = "resize"`, `full_size = "960x q90"`
* Do no scaling or quality change of the full-sized version of the image: `full_resize_method = "none"`

## Comparison to Phugo

Unfortunately the [original Phugo](https://github.com/aerohub/phugo) hasn't been updated in a while, and was dropped from common theme lists.  AutoPhugo implements the pull requests over on Phugo, causing it to work error-free on modern Hugo.  Further, it sets standardized column layout, automatically builds albums based on files alone (Phugo required entering each filename as a shortcode), and automatically resizes photos for display and thumbnail.  Plus, subalbums.

## Acknowledgements

* Subgallery support - tfl0pz, Ognyan Nikolov
* [Magnific Popup lightbox](https://dimsemenov.com/plugins/magnific-popup/) - Dmitry Semenov

## License

The original template is released under the Creative Commons Attribution 3.0 License. Please keep the original attribution link when using for your own project.

The Magnific Popup lightbox is available under the MIT license, more info at their website linked above.
