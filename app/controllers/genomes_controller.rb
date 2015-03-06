class GenomesController < ApplicationController
  def query
    chr = params["chrom"]
    locs = params["locs"]
    candidates = Genome.where(chrom: chr)
    result = Array.new
    locs.each_slice(100_000) do |slice|
      result += candidates.where(loc: slice)
    end
    result.sort_by!(&:loc).map!(&:value)
    respond_to do |format|
      format.json {render json: result}
    end
  end
end
