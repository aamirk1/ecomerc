<?php


namespace setasign\Fpdi\PdfParser\Filter;

/**
 * Exception for Ascii85 filter class
 *
 * @package setasign\Fpdi\PdfParser\Filter
 */
class Ascii85Exception extends FilterException
{
    /**
     * @var integer
     */
    const ILLEGAL_CHAR_FOUND = 0x0301;

    /**
     * @var integer
     */
    const ILLEGAL_LENGTH = 0x0302;
}
