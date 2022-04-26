<?php


namespace setasign\Fpdi\PdfParser\Type;

use setasign\Fpdi\PdfParser\PdfParserException;

/**
 * Exception class for pdf type classes
 *
 * @package setasign\Fpdi\PdfParser\Type
 */
class PdfTypeException extends PdfParserException
{
    /**
     * @var int
     */
    const NO_NEWLINE_AFTER_STREAM_KEYWORD = 0x0601;
}
