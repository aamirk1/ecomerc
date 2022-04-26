<?php

namespace setasign\Fpdi\PdfParser\Filter;

/**
 * Exception for flate filter class
 *
 * @package setasign\Fpdi\PdfParser\Filter
 */
class FlateException extends FilterException
{
    /**
     * @var integer
     */
    const NO_ZLIB = 0x0401;

    /**
     * @var integer
     */
    const DECOMPRESS_ERROR = 0x0402;
}
