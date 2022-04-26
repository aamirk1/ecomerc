<?php


namespace setasign\Fpdi\PdfParser\Filter;

/**
 * Exception for LZW filter class
 *
 * @package setasign\Fpdi\PdfParser\Filter
 */
class LzwException extends FilterException
{
    /**
     * @var integer
     */
    const LZW_FLAVOUR_NOT_SUPPORTED = 0x0501;
}
