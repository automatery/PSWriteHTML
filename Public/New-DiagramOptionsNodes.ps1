function New-DiagramOptionsNodes {
    [alias('DiagramOptionsNodes')]
    [CmdletBinding()]
    param(
        [nullable[int]] $BorderWidth,
        [nullable[int]] $BorderWidthSelected,
        [string] $BrokenImage,
        [nullable[bool]] $Chosen,
        [RGBColors] $ColorBorder = [RGBColors]::None,
        [RGBColors] $ColorBackground = [RGBColors]::None,
        [RGBColors] $ColorHighlightBorder = [RGBColors]::None,
        [RGBColors] $ColorHighlightBackground = [RGBColors]::None,
        [RGBColors] $ColorHoverBorder = [RGBColors]::None,
        [RGBColors] $ColorHoverBackground = [RGBColors]::None,
        [nullable[bool]] $FixedX,
        [nullable[bool]] $FixedY,
        [RGBColors] $FontColor = [RGBColors]::None,
        [nullable[int]] $FontSize, #// px
        [string] $FontName,
        [RGBColors] $FontBackground = [RGBColors]::None,
        [nullable[int]] $FontStrokeWidth, #// px
        [RGBColors] $FontStrokeColor = [RGBColors]::None,
        [ValidateSet('center', 'left')][string] $FontAlign,
        [ValidateSet('false', 'true', 'markdown', 'html')][string]$FontMulti,
        [nullable[int]] $FontVAdjust,
        [nullable[int]] $Size,
        [parameter(ParameterSetName = "Shape")][string][ValidateSet(
            'circle', 'dot', 'diamond', 'ellipse', 'database', 'box', 'square', 'triangle', 'triangleDown', 'text', 'star', 'hexagon')] $Shape,
        [nullable[int]] $HeightConstraintMinimum,
        [ValidateSet('top', 'middle', 'bottom')][string] $HeightConstraintVAlign,
        [nullable[int]] $WidthConstraintMinimum,
        [nullable[int]] $WidthConstraintMaximum,
        [nullable[int]] $Margin,
        [nullable[int]] $MarginTop,
        [nullable[int]] $MarginRight,
        [nullable[int]] $MarginBottom,
        [nullable[int]] $MarginLeft
    )
    $Object = [PSCustomObject] @{
        Type     = 'DiagramOptionsNodes'
        Settings = @{
            nodes = [ordered] @{
                borderWidth         = $BorderWidth
                borderWidthSelected = $BorderWidthSelected
                brokenImage         = $BrokenImage
                chosen              = $Chosen
                color               = [ordered]@{
                    border     = ConvertFrom-Color -Color $ColorBorder
                    background = ConvertFrom-Color -Color $ColorBackground
                    highlight  = [ordered]@{
                        border     = ConvertFrom-Color -Color $ColorHighlightBorder
                        background = ConvertFrom-Color -Color $ColorHighlightBackground
                    }
                    hover      = [ordered]@{
                        border     = ConvertFrom-Color -Color $ColorHoverBorder
                        background = ConvertFrom-Color -Color $ColorHoverBackground
                    }
                }
                fixed               = [ordered]@{
                    x = $FixedX
                    y = $FixedY
                }
                font                = [ordered]@{
                    color       = ConvertFrom-Color -Color $FontColor
                    size        = $FontSize #// px
                    face        = $FontName
                    background  = ConvertFrom-Color -Color $FontBackground
                    strokeWidth = $FontStrokeWidth #// px
                    strokeColor = ConvertFrom-Color -Color $FontStrokeColor
                    align       = $FontAlign
                    multi       = $FontMulti
                    vadjust     = $FontVAdjust
                }
                heightConstraint    = @{
                    minimum = $HeightConstraintMinimum
                    valign  = $HeightConstraintVAlign
                }
                size                = $Size
                shape               = $Shape
                widthConstraint     = @{
                    minimum = $WidthConstraintMinimum
                    maximum = $WidthConstraintMaximum
                }
            }
        }
    }

    if ($Margin) {
        $Object.Settings.nodes.margin = $Margin
    } else {
        $Object.Settings.nodes.margin = @{
            top    = $MarginTop
            right  = $MarginRight
            bottom = $MarginBottom
            left   = $MarginLeft
        }
    }


    Remove-EmptyValues -Hashtable $Object.Settings -Recursive -Rerun 2
    $Object
}

<#
// these are all options in full.
var options = {
  nodes:{
    borderWidth: 1,
    borderWidthSelected: 2,
    brokenImage:undefined,
    chosen: true,
    color: {
      border: '#2B7CE9',
      background: '#97C2FC',
      highlight: {
        border: '#2B7CE9',
        background: '#D2E5FF'
      },
      hover: {
        border: '#2B7CE9',
        background: '#D2E5FF'
      }
    },
    fixed: {
      x:false,
      y:false
    },
    font: {
      color: '#343434',
      size: 14, // px
      face: 'arial',
      background: 'none',
      strokeWidth: 0, // px
      strokeColor: '#ffffff',
      align: 'center',
      multi: false,
      vadjust: 0,
      bold: {
        color: '#343434',
        size: 14, // px
        face: 'arial',
        vadjust: 0,
        mod: 'bold'
      },
      ital: {
        color: '#343434',
        size: 14, // px
        face: 'arial',
        vadjust: 0,
        mod: 'italic',
      },
      boldital: {
        color: '#343434',
        size: 14, // px
        face: 'arial',
        vadjust: 0,
        mod: 'bold italic'
      },
      mono: {
        color: '#343434',
        size: 15, // px
        face: 'courier new',
        vadjust: 2,
        mod: ''
      }
    },
    group: undefined,
    heightConstraint: false,
    hidden: false,
    icon: {
      face: 'FontAwesome',
      code: undefined,
      size: 50,  //50,
      color:'#2B7CE9'
    },
    image: undefined,
    imagePadding: {
      left: 0,
      top: 0,
      bottom: 0,
      right: 0
    },
    label: undefined,
    labelHighlightBold: true,
    level: undefined,
    mass: 1,
    physics: true,
    scaling: {
      min: 10,
      max: 30,
      label: {
        enabled: false,
        min: 14,
        max: 30,
        maxVisible: 30,
        drawThreshold: 5
      },
      customScalingFunction: function (min,max,total,value) {
        if (max === min) {
          return 0.5;
        }
        else {
          let scale = 1 / (max - min);
          return Math.max(0,(value - min)*scale);
        }
      }
    },
    shadow:{
      enabled: false,
      color: 'rgba(0,0,0,0.5)',
      size:10,
      x:5,
      y:5
    },
    shape: 'ellipse',
    shapeProperties: {
      borderDashes: false, // only for borders
      borderRadius: 6,     // only for box shape
      interpolation: false,  // only for image and circularImage shapes
      useImageSize: false,  // only for image and circularImage shapes
      useBorderWithImage: false  // only for image shape
    }
    size: 25,
    title: undefined,
    value: undefined,
    widthConstraint: false,
    x: undefined,
    y: undefined
  }
}

network.setOptions(options)
#>